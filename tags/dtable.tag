<dtable>
    <h5>{ opts.season } - { credits } credits</h5>
    <table class="highlight">
        <thead>
            <tr>
                <th>Course</th>
                <th>Credits</th>
                <th>Grade</th>
            </tr>
        </thead>
        <tr draggable="true" each={ courses } id = { generateID() } data-notes = { notes }>
            <td>{ course_id }</td>
            <td>{ credits }</td>
            <td>{ grade }</td>
        </tr>
        <tr class='empty'><td colspan="3">No classes added</td></tr>
    </table>
    <script>
        var $n;
        this.courses = opts.courses;
        this.updated = false;
        this.credits = 0;

        this.on('mount', function() {
            $n = $(this.root);

            function cancel(e) {
                if (e.preventDefault) {
                    e.preventDefault();
                }
                return false;
            }

            $n.click(function(){
                console.log('av');
            });

            $n.find('tr').on('dragstart', e => {
                e.originalEvent.dataTransfer.setData('text/plain', e.target.id);
                this.updated = false;
	        });

            $n.on('dragover', cancel);
            $n.on('dragenter', cancel);
            $n.on('drop', e => {
                var data = e.originalEvent.dataTransfer.getData("text");

                var tar = $(e.originalEvent.target).parent();

                if(tar.is("tr")) {
                    $('#' + data).insertAfter(tar);
                } else {
                    cancel(e);
                }
                this.calcCredits();
                riot.update();
                e.originalEvent.dataTransfer.clearData();
            });

            this.calcCredits();

            $(document).ready(function() {
                $.each($n.find('tr'), function(i, val) {
                    if($(this).attr('draggable')) {
                        $(this).on('dblclick', function() {
                            $('#course-id-input').val($(this).find(':nth-child(1)')[0].innerHTML);
                            $('#course-credits-input').val($(this).find(':nth-child(2)')[0].innerHTML);
                            $('#course-grade-input').val($(this).find(':nth-child(3)')[0].innerHTML);
                            $('#notes').val(($(this).data('notes')));
                            $('#edit-course').modal('open');
                        });
                    }
                });
            });
        });

        this.calcCredits = function () {
            var sum = 0;
            $.each($n.find('tr'), function(i, val) {

                if($(this).attr('draggable')) {
                    sum += parseInt($(this).find(':nth-child(2)')[0].innerHTML);
                }
            });

            this.credits = sum;
            this.update();
        }

        this.on('update', () => {
            if(!this.updated) {
                this.updated = true;
                this.calcCredits();
            }
        });
    </script>
    <style>
        table {
            height: 1em;
        }

        .empty {
            display: none;
            width: 100%;
        }

        .empty:only-child {
            display: table-row;
        }

        tr {
            width: 100%;
        }
    </style>
</dtable>
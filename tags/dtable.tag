<dtable>
    <h5>{ opts.season } - { credits } credits</h5>
    <table class="striped">
        <thead>
            <tr>
                <th>Course</th>
                <th>Credits</th>
                <th>Grade</th>
            </tr>
        </thead>
        <tr draggable="true" each={ courses } id = { this.generateID() }>
            <td>{ course_id }</td>
            <td>{ credits }</td>
            <td>{ grade }</td>
        </tr>
        <tr class='empty'><td colspan="3">No classes added</td></tr>
    </table>
    <script>
        this.on('mount', function() {
            var $n = $(this.root);

            $n.click(function(){
                console.log('av');
            });

            $n.find('tr').on('dragstart', e => {
                e.originalEvent.dataTransfer.setData('text/plain', e.target.id);
	        });

            function cancel(e) {
                if (e.preventDefault) {
                    e.preventDefault();
                }
                return false;
            }

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

                e.originalEvent.dataTransfer.clearData();
            });
        });

        this.courses = opts.courses;

        this.generateID = function() {
            idCounter++;

            return "a" + idCounter;
        }

        this.calcCredits = function () {
            console.log(this);
        }

        this.credits = 3;
        this.calcCredits();
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
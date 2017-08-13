<year>
    <h3>freshman</h3>
    <div id="main" class='row'>
        <dtable each={ seasons } id='freshman-{ s }' class='{ s } col s3'></dtable>
    </div>

    <script>
        this.id = opts.id;
        this.seasons = [{'s':'fall'}, {'s':'spring'}, {'s':'winter'}, {'s':'summer'}];

        this.on('mount', function() {
        riot.mount('.fall', opts = {
                                    season: "Fall",
                                    courses: placeholder
                                });
            riot.mount('.spring', opts = {
                                    season: "Spring",
                                    courses: placeholder
                                    });
            riot.mount('.winter', opts = {
                                    season: "Winter",
                                    courses: placeholder});
            riot.mount('.summer', opts = {season: "Summer",
                                    courses: placeholder});
        });
    </script>
    <style>
        h3, h5 {
            text-transform: capitalize
        }
    </style>
</year>
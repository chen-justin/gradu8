Vue.component('display', {
    template: `
        <div>
            <span v-show='!edit' @dblclick='edit=true;'>{{p_data}}</span>
            <div class="input-field inp-custom" v-show='edit'>
                <input :id="p_data" type="text" ref="inp"
                        v-model=p_data
                        v-on:blur='edit=false'
                        @keyup.enter='edit=false'
                        autofocus/>
            </div>
        </div>
    `,
    props: ['p_data'],
    data: function() {
        return {
            edit: false
        }
    }
});

Vue.component('tr-d', {
    template: `
        <tr >
            <td>{{course.course_id}}</td>
            <td>{{course.credits}}</td>
        </tr>
    `,
    props: ['course']
});

 $(document).ready(function() {
    $('select').material_select();
  });

Vue.component('semester', {
    template: `<div class='semester col s3'>
                <h4>{{time}}</h4>
                <table class='striped'>
                <tbody>
                    <tr>
                        <th>Class</th>
                        <th>Credits</th>
                    </tr>
                    <tr v-for="course in courses" is="tr-d" v-bind:course="course" v-bind:id="course.course_id"></tr>
                    </tbody>
                </table>
            </div>`,
    data: function() {
        return {
            courses: [{
                course_id: "CMSC330",
                credits: 3,
                edit: false
            }, {
                course_id: "CMSC351",
                credits: 3,
                edit: false
            }, {
                course_id: "CMSC298",
                credits: 1,
                edit: false
            }]
        }
    },
    props: ['time']
});

new Vue({el:"#main"})
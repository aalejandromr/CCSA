// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require camaleon_cms/bootstrap.min
//= require moment 
//= require fullcalendar



$(document).ready(function(){
     var options = {
     theme: true,
     header: {
      left: 'prev,next, today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay,agenda'
     },
     timeFormat: {
      agenda: 'h(:mm)t{ - h(:mm)t}',
      '': 'h(:mm)t{-h(:mm)t }'
     },
     monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
     monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
     dayNames: [ 'Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
     dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
     buttonText: {
      today: 'Hoy',
      prev: 'Ant.',
      next: 'Sig.',
      month: 'Mes',
      week: 'Semana',
      day: 'Día'
     },
    dayClick: function() {
        console.log($(this[0]).attr('data-date'));
    }
    };
  $('#calendar').fullCalendar(options);
});
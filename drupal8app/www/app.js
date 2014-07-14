// Add parameter passing for view and edit pages.
$(function () {
    $.mobile.paramsHandler.addPage("view", ["id"], [], 
        function (params) {
            $("#nid").html(params.id);
        }
    );
    $.mobile.paramsHandler.addPage("edit", ["id"], [],
        function (params) {
            $("#nid").html(params.id);
        }
    );

    $.mobile.paramsHandler.init();
});

$(document).on("pageinit", "#list", function( event ) {


$.ajax({
  url: "http://8.x.local:8083/node",
  // Add custom header for HAL.
  beforeSend: function( jqXHR ) {
    jqXHR.setRequestHeader('Accept', 'application/hal+json');
  }
})
 .done(function( data ) {
    var items = [];

    // Request was successful; loop through each result.
    $(data).each(function( key, value ) {
      var title = $(data)[key]["title"][0]["value"];

      // Get the node ID of the record from the end of the URL.
      // @todo: There *has* to be a better way than this. :P
      var url = $(data)[key]["_links"]["self"]["href"];
      var nid = url.substring(url.lastIndexOf('/') + 1);

      // Build an array of rows.
      items.push('<li><a href="#view?id=' + nid + '">' + title + '</a><a href="#edit?id=' + nid + '">Edit</a></li>');
    });

    // Add rows to the listview.
    $("#content-list").append( items.join('') );

    // Refresh the listview to style the new rows.
    $("#content-list").listview("refresh");
  })
  .fail(function() {
    alert( "error" );
  });

});

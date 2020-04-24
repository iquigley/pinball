@extends('inc.common')


@section('title')Behold... My Pinball Machines are Many!
@endsection

@section('content')
<style>
    .image-gallery{
        float:left;
    }
    .image-display{
        height: 200px;
    }
</style>
<div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <a href="/"><button class='btn btn-primary'>Home <i class='fas fa-home'></i></button></a>
                            <a href="/pinball/create"><button class='btn btn-primary'>Add New <i class='fas fa-plus'></i></button></a>
                            <table class='table table-striped table-bordered table-hover'>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image<br/>
                                            (click me)</th>
                                        <th>Name</th>
                                        <th>Model Number</th>
                                        <th>Manufacturer</th>
                                        <th>Date of Manufacture</th>
                                        <th>View</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if (!count($pinballMachines))
                                    <div>You have no pinball machines. :( </div>
                                    @else
                                        @foreach ($pinballMachines as $pinball)
                                        <tr>
                                            <td>{{$pinball->id}}</td>
                                            <td><img src='{{$pinball->getCoverImageLink()}}'  onclick="displayModal('{{$pinball->uuid}}','{{$pinball->name}}')" class='img-thumbnail image-preview'/></td>
                                            <td>{{$pinball->name}}</td>
                                            <td>{{$pinball->id}}</td>
                                            <td>{{$pinball->manufacturer}}</td>
                                            <td>{{$pinball->date_of_manufacture}}</td>
                                            <td class="table-button">
                                                <a href="/pinball/show/{{$pinball->id}}"><i class="far fa-eye" aria-hidden="true"></i></a>
                                            </td>
                                            <td class="table-button">
                                                <a href='/pinball/edit/{{$pinball->id}}' ><i id='' class='fa fa-pencil-square-o' style='margin-right:4px;' aria-hidden='true'></i></a>
                                            </td>
                                            <td>
                                                <a href='/pinball/delete/{{$pinball->id}}' data-method='delete' onclick='return confirmDelete()' ><i id='' class='fa fa-trash' aria-hidden='true'></i></a>
                                            </td>
                                        </tr>
                                        @endforeach
                                   @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


<div id='myModal' class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body image-gallery">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
    $('.table').DataTable({
        dom: 'Bfrtilp',
        buttons: [],
        fixedHeader: true,
        colReorder: true,
        order: [],
        stateSave: true
    });

    function confirmDelete() {
        return confirm("Are you sure you want to delete this entry?");
    }

    function displayModal(uuid, name) {
        // Clear out the current images.
        $("image-gallery").empty();
        // Make an ajax call to get all of the current images.
        var sendData = { _token: "{{ csrf_token() }}", pinball_uuid: uuid };
        $.ajax({
            url: "/pinball/get-photos",
            type: "POST",
            data: sendData,
            success: function (data, textStatus, jqXHR) {
            // Populate the modal window.
                var pics = JSON.parse(data);
                $(pics).each(function(){
                    $(".image-gallery").append("<img src='" + this.file_name + "' class='image-display' />");
                });
                $(".modal-title").append(name);
            // Open the window.
            $('#myModal').modal('toggle');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });
    }
    </script>
@endsection
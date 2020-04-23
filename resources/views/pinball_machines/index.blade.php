@extends('inc.common')


@section('title')Behold... My Pinball Machines are Many!
@endsection

@section('content')
<div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <a href="pinball/add"><button>Add New</button></a>
                            <table class='table table-striped table-bordered table-hover'>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Model Number</th>
                                        <th>Manufacturer</th>
                                        <th>Date of Manufacture</th>
                                        <th>View</th>
                                        <th>Edit/Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if (!count($pinballMachines))
                                    <div>You have no pinball machines. :( </div>
                                    @else
                                        @foreach ($pinballMachines as $pinball)
                                        <tr>
                                            <td><a href='pinball/{{$pinball->id}}' target='_self' ></a>{{$pinball->id}}</td>
                                            <td>Image</td>
                                            <td>{{$pinball->name}}</td>
                                            <td>{{$pinball->id}}</td>
                                            <td>{{$pinball->manufacturer}}</td>
                                            <td>{{$pinball->date_of_manufacture}}</td>
                                            <td class="table-button"><a href="{{$pinball->id}}"><i class="far fa-eye" aria-hidden="true"></i></a></td>
                                            <td class="table-button">
                                                <a href='update/{{$pinball->id}}' ><i id='' class='fa fa-pencil-square-o' style='margin-right:4px;' aria-hidden='true'></i></a>
                                                <a href='delete/{{$pinball->id}}' data-method='delete' onclick='return confirmDelete()' ><i id='' class='fa fa-trash' aria-hidden='true'></i></a>
                                            </td>
                                        </tr>
                                        @endforeach
                                   @endif
                                </tbody>
                            </table>
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
    </script>
@endsection
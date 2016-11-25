<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap" />
    <link href="${bootstrap}" rel="stylesheet" />


    <script   src="http://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function (){
            $('#ajaxRequest').click(function () {
                var title = $('#title').val();
                var comment = $('#comment').val();
                var tags = $('#tags').val();
                var jsonString = JSON.stringify({
                    title : title,
                    comment : comment,
                    tags : tags
                });
                $.ajax({
                        type: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        url: '/addComment/ajax',
                        contentType: "application/json; charset=utf-8",
                        data: jsonString,
                        async: false,
                        cache: false,
                        processData:false,
                        success: function (result) {
                            $('#result').html(result);
                        }
                    });
            });
        });
    </script>
</head>
<body>
    <div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">Project name</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="viewComments">Просмотр Заметок</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">Nav header</li>
                                <li><a href="#">Separated link</a></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>
    <div class="container">
        <form method="post" action="/addComment/postAddedComment">
        <div class="form-group">
            <input type = "text" name = "title" id="title" />
            <label>Заметка</label>
            <textarea id = "comment" name = "comment" class="form-control" rows = "10"> </textarea>
            <label>Теги</label>
            <textarea id = "tags" name = "tags" class="form-control" rows="1"> </textarea>
            <button type = "submit" class="btn btn-primary" > Отправить на контроллер </button>
        </div>
    </form>
    <button id="ajaxRequest" class="btn btn-primary">Отправить AJAX</button>
    <span id="result"></span>
    </div>
</body>
</html>

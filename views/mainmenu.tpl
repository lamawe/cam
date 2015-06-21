<!-- Menu -->
<%
  mi_home = True if (mi =='home') else False
  mi_cam = True if (mi =='cam') else False
  mi_pic = True if (mi =='pic') else False
%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Wes's Pi Camera</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
         <li {{! 'class="active"' if mi_home else "" }}><a href="index.html">Home Page</a></li>
         <li {{! 'class="active"' if mi_cam else "" }}><a href="cam">Camera Control</a></li>
         <li {{! 'class="active"' if mi_pic else "" }}><a href="pic">View Last Picture</a></li>
      </ul>
    </div>
  </div>
</nav>

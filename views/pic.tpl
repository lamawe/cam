% include('beginhtml.tpl')
% include('mainmenu.tpl', mi='pic')
<div class="container">
  <img border="0" alt="Most Recent Picture" src="lastpic">
  <p>FileType: {{ft}} | Resolution {{rx}}, {{ry}} | Style: {{style}} | fx:{{fx}} | Note: {{note}}</p>
</div>
% include('endhtml.tpl')

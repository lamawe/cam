% include('beginhtml.tpl')
% include('mainmenu.tpl', mi='cam')
<div class="container">
<form action="/cam" method="post">
  <div class="form-group">
    <label for="filetype">File Type</label>
    <select name="filetype" class="form-control">
        <option value="jpg">jpg</option>
        <option value="gif">gif</option>
        <option value="bmp">bmp</option>
     </select><br/>
     <label for="resolution">Resolution</label> 
     <select name="resolution" class="form-control">
        <option value="small">small</option>
        <option value="medium">medium</option>
        <option value="large">large</option>
        <option value="xtra-large">xtra-large</option>
        <option value="full">full</option>
     </select><br/>
     <label for="style">Saturation</label>     
     <select name="style" class="form-control">
        <option value="color">Color</option>
        <option value="fx01">Faded Color</option>
        <option value="bw">Black & White</option>
     </select><br/>
     <label for="effect">Effect</label>
     <select name="effect" class="form-control">
        <option value="none">None</option>
        <option value="negative">Negative</option>
        <option value="solarize">Solarize</option>
        <option value="sketch">Sketch</option>
        <option value="oilpaint">Oil Paint</option>
        <option value="hatch">Hatch</option>
        <option value="gpen">Gel Pen</option>
        <option value="pastel">Pastel</option>
        <option value="watercolor">WaterColor</option>
        <option value="film">Film</option>
        <option value="posterise">Posterize</option>
        <option value="colorpoint">Color Point</option>
        <option value="cartoon">Cartoon</option>
     </select><br/>
     <label for="caption">Caption</label>
     <input type="text" name="caption" class="form-control"><br/>
   </div>
     <input value="Take Picture" type="submit"><br/>
</form> 
</div>
% include('endhtml.tpl')

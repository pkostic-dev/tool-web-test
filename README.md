<h1>Web export test tool for Godot 4.2</h1>
<h2>About</h2>
<p>A tool for testing the web export of Godot Engine 4.2. Currently built with Godot 4.2.rc2 using the Compatibility renderer, the only one that supports web platforms. Uses the OpenGL 3 backend (WebGL2). It contains various scenes in order to test different Godot functionalities :<br></p>
<ul><li>2D pixel art scene.<ul><li>Change zoom level.</li><li>Change camera speed.</li></ul></li><li>3D scene<ul><li>WIP<br>
</li></ul></li><li>GPU Particles<ul><li>Fire test</li></ul></li><li>Shaders<ul><li>9 different shaders.</li></ul></li><li>Settings<ul><li>Change project settings on the fly.</li></ul></li></ul>
<h2>How&nbsp;to&nbsp;use</h2>
<p>This tool can be used in two different ways :</p>
<ol><li>Use the tool on this page to test how well Godot features work on your browser. Some settings can be changed on the fly in the Settings.</li><li>Clone or fork the project  and modify it. You can then upload the export on itch.io. Change the settings so that it more closely resembles what you plan on exporting.</li></ol>
<h2>Itch.io settings</h2>
<p>When uploading the exported tool to itch.io so that it can be used in the browser, you can change a few settings.<br></p>
<ul><li>If embedded in page, choose "Manually set size". <strong>(required)<br></strong>
<ul><li>Viewport dimensions are set to 640 x 360 by default.</li></ul></li><li>SharedArrayBuffer support must be enabled. <strong>(required)</strong></li></ul>
<h2>Godot settings</h2>
<p>I won't be listing all the settings that can be changed in the Godot Engine. Try messing with both Project Settings and Export Settings. The most important settings from Project Settings&nbsp;can already be changed on the fly in the tool on this page. To change export settings you will have to change the source code.</p>
<h2>Notes</h2>
<h4>WIP</h4>
<ul><li>Loading shaders before loading the scene with the shaders so that there's no freeze.<ul><li>Same with particles ?</li></ul></li><li>3D movement.</li><li>Controller support.</li></ul>
<h2>F.A.Q.</h2>
<p><em><strong>Why does this exist ?<br></strong></em></p>
<p>Because the web export for Godot 4 is wonky and I wanted to test things out.<em><br></em></p>
<p><em><strong>Where did you get the tile set from ?</strong></em><br>
    </p>
<p>The tile set used is also CC0, you can get the file <a href="https://opengameart.org/content/mage-city-arcanos" target="_blank">here</a>.
</p>

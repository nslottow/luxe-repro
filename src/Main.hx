
import luxe.Input;
import luxe.Vector;
import luxe.Color;
import luxe.Camera;
import luxe.Log.*;

class Main extends luxe.Game {

    var debug_text:luxe.Text;
    var sprite:luxe.Sprite;
    var bg_sprite:luxe.Sprite;

    override function config(config:luxe.AppConfig) {
        return config;
    } //config

    override function ready() {
        Luxe.renderer.clear_color = new Color(0, 0.5, 0.5);

        Luxe.camera.size = new Vector(375, 667);

        sprite = new luxe.Sprite({
            pos: new Vector(10, 10),
            size: new Vector(64, 64),
            centered: false
        });

        bg_sprite = new luxe.Sprite({
            size: new Vector(100000, 100000),
            color: new Color(0.5, 0.2, 0),
            depth: -1
        });

        debug_text = new luxe.Text({
            pos: new Vector(10, 80),
            point_size: 18
        });

        var canvas = Luxe.core.app.runtime.window;
        var s = 'window_size: (${js.Browser.window.innerWidth}, ${js.Browser.window.innerHeight})\n' +
                'screen_size: (${Luxe.screen.w}, ${Luxe.screen.h})\n' +
                'canvas_size: (${canvas.width}, ${canvas.height})\n' +
                'client_size: (${canvas.clientWidth}, ${canvas.clientHeight})\n';

        trace(s);
    } //ready

    override function onkeydown(e:luxe.KeyEvent) {
        if (e.keycode == Key.space) {
            var size = Luxe.camera.size;
            Luxe.camera.size = size == null ? new Vector(375, 667) : null;
        }
    }

    override function update(dt:Float) {
        var canvas = Luxe.core.app.runtime.window;
        var s = 'window_size: (${js.Browser.window.innerWidth}, ${js.Browser.window.innerHeight})\n' +
                'screen_size: (${Luxe.screen.w}, ${Luxe.screen.h})\n' +
                'canvas_size: (${canvas.width}, ${canvas.height})\n' +
                'client_size: (${canvas.clientWidth}, ${canvas.clientHeight})\n';
        debug_text.text = s;
    }
} //Main

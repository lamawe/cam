from bottle import error, get, post, request, route, run, template, static_file, SimpleTemplate
import time
import pickle
import picamera
from picamera.color import Color
from fractions import Fraction

#
# HomePage (index.html)
@route('/')
@route('/home')
@route('/index.html')
def welcome():
    return template('home.tpl')

@get('/cam')
def cam():
    return template('settings.tpl')

@post('/cam')
def cam_capture():
    resx = {'small': 640, 'medium':1024, 'large': 1280, 'xtra-large':1600, 'full':2592}
    resy = {'small': 480, 'medium':768, 'large':1024, 'xtra-large':1200, 'full':1944}
    sat = {'color': 0, 'bw': -100, 'fx01': -50}
    
    filetype = request.forms.get('filetype')
    res = request.forms.get('resolution')
    style = request.forms.get('style')
    effect = request.forms.get('effect')
    caption = request.forms.get('caption')

    x = resx[res]
    y = resy[res]
    s = sat[style]
    cam = picamera.PiCamera()
    #cam.framerate = Fraction('24')
    cam.annotate_backgrund = Color('#000000')
    cam.annotate_foregroud = Color('#FF0000')
    cam.annotate_text = caption
    
    #cam.start_preview()
    #time.sleep(3)
    cam.resolution = (x, y)
    cam.saturation = s
    
    cam.flash_mode = 'on'

    cam.image_effect = effect
    
    cam.capture('/home/pi/Projects/cam/images/a.jpg')
    cam.close()

    r = {'filetype' : filetype,
         'rx' : resx[res],
         'ry' : resy[res],
         'style' : style,
         'effect' : effect,
         'caption' : caption }
    
    f = open('/home/pi/Projects/cam/images/a.txt', 'w')
    pickle.dump(r, f)
    f.close()

    return template('pic.tpl', ft=filetype, rx=resx[res], ry=resy[res], style=style, fx=effect, note=caption)    


@route('/pic')
def pic():
    f = open('/home/pi/Projects/cam/images/a.txt', 'r')
    r = pickle.load(f)
    f.close()
    return template('pic.tpl', ft=r['filetype'], rx=r['rx'], ry=r['ry'], style=r['style'], fx=r['effect'], note=r['caption'])

    
@route('/lastpic')
def lastpic():
    return static_file("a.jpg", root="/home/pi/Projects/cam/images")

#
# Manage static resoures
@route('/static/<path:path>')
def serve_static(path):
    return static_file(path, root="/home/pi/Projects/cam/static")

#
# Handle Errors (404 - File Not Found)
@error(404)
def error404(error):
    return 'Page Missing.'

run(host='192.168.1.39', port=8080, debug=True)

# print a circle where the screen was pressed

from psychopy import visual, core, event
from psychopy.iohub.client import launchHubServer

io      = launchHubServer()

myWin   = visual.Window(monitor= None ,units="pix", fullscr=True, allowGUI=True, color=[-1,-1,-1])
myMouse = io.devices.mouse
evMouse = event.Mouse(win = myWin)


circle = visual.Circle(myWin,radius = 1,fillColor=[1,1,1],colorSpace='rgb')
goal   = visual.Circle(myWin,radius = 30, fillColor = [1,1,1],colorSpace='rgb')
timer = core.Clock()

# set up location for targets to hit

range_x,range_y = myWin.size
min_x = 
max_x = 
min_y = 
max_y = 

calib_pos = ([-630.0,350.0],[-630.0,-350.0],[630.0,-350.0],[630.0,350.0])


for pos in calib_pos:
    goal.setPos(pos)
    print(pos)
    show_target = True
    t = timer.getTime()
    goal.setColor([1,1,1],colorSpace='rgb')
    try:
        while show_target and timer.getTime()-t < 5:
            circle.setPos(myMouse.getPosition())
            circle.draw()
            goal.draw()
            myWin.flip()
            if goal.contains(myMouse.getPosition()):
                goal.setColor([-1,-1,-1],colorSpace='rgb')
                print('event gives a position of {}'.format(evMouse.getPos()))
                print('iohub gives a position of {}'.format(myMouse.getPosition()))
                print('the target is at {}'.format(goal.pos))
                show_target = False
    except: 
        print('nono')
        pass

core.wait(3.0)
myWin.flip()
myWin.close
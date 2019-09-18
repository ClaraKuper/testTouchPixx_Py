from psychopy import core, visual, event

myWin = visual.Window()
myMouse=event.Mouse()

stim = visual.Circle(myWin,radius=0.3,fillColor=[1,1,1])

stim.draw()
myWin.flip()
while True:
    mousePos = myMouse.getPos()
    if stim.contains(mousePos):
        break
    core.wait(0.001)

core.quit()
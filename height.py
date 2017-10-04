# Created by: Kay Lin
# Created on: Sep 25th 2017
# Created for: ICS3U
# This program calculates the height of the object above the ground,
#   when you give it the time

import ui

def calculate_touch_up_inside(sender):
    # calculate height
    
    # constants
    g = 9.81
    
    # input
    time = int(view['time_textbox'].text)
    
    #process
    height = 100 - 0.5 * g * (time ** 2)
    
    #output
    view['answer_label'].text = 'The height is ' + str(height) + ' m'
    
    if height < 0:
       view['answer_label'].text = 'Height cannot be negative.'

    

view = ui.load_view()
view.present('full_screen')

# technical task

## The statManagement used
 * Cubit 

## The CleanArchitect used
* MVVM 

## The package used
* flutter_bloc
* google_fonts
* shared_preferences
* percent_indicator
* flutter_svg

### UserFlow : 
- mainApp 
* model :  
      - list_color_model => for color and toggle between color,
      -list_icons-pat => for path image NavigationBar
  
* view :  
  * * screen 
      * * * Main_scree 
      - main_screen => this for check and toggle enter_screen or home_page on NavigationBar
      - enter_screen => for enter score and go to home_page ,
      
    * * * Navigation_screen  
      - home_page => this It contains the card and the animation of the score, which is also specified by the added number and must be in decimals, and then it appears in the total score                         and also in the progress.
        - badge_scree => it contains image empty and text.
        - tennis_screen => it contains image empty and text.
        - profile_scree => it contains image empty and text.
         ,
    * * * widget_screen  
      - home_page => this found card info for home page 
      - list_view => for badges section
         ,
    * * * error_info => for screen empty 
     
 
* view_model :  
    * * bottom_nav_cubit = > for the toggle and saved clicked between screen 
    * * latest_badges_cubit => for get data latest badges from list image 
    * * popular_cubit => for get data popular from list image 
    * * utils  
         - constants => for ballet color 
    ,
  




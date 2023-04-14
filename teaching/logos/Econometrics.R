library(hexSticker)
library(magick)
library(sysfonts)
library(tidyverse)

p <- mtcars |> 
        filter(wt<5) |> 
            ggplot(aes(x=mpg, y=-wt)) + 
            geom_point(size=0.4) + 
            geom_smooth(method="lm", size=0.7, color="orangered4") + 
            ylim(c(-4.1,-0.5)) +
            theme_void() + 
            theme_transparent() 

p

sticker(
  subplot = p,
  package = "Econometrics",
  s_width = 1.5,
  s_height = 1.25,
  s_x = 1.1,
  s_y = 0.9,
  p_size = 17,
  h_fill = "#2774AE",
  h_color = "#FFD100",
  h_size = 1.25,
  url = "       UCLA MFE 402",
  u_size = 8,
  u_color = "white",
  u_x = 1
) |> print()

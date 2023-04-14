library(hexSticker)
library(magick)
library(sysfonts)
library(tidyverse)

img <- image_read("under_development.png")

sticker(
    subplot = img,
    package = "Business\nAnalytics",
    s_width = 0.5,
    s_height = 0.5,
    s_x = 1,
    s_y = 0.75,
    p_size = 17,
    h_fill = "#182B49",
    h_color = "#FFCD00",
    h_size = 1.25,
    url = "     UCSD MGT 153",
    u_size = 8,
    u_color = "white",
    u_x = 1
) |> print()

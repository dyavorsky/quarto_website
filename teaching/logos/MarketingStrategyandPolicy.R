library(hexSticker)
library(magick)
library(sysfonts)
library(tidyverse)

img <- image_read("ßunder_development.png")

sticker(
    subplot = img,
    package = "Marketing\nStrategy & Policy",
    s_width = 0.5,
    s_height = 0.5,
    s_x = 1,
    s_y = 0.75,
    p_size = 17,
    h_fill = "#2774AE",
    h_color = "#FFD100",
    h_size = 1.25,
    url = "     UCLA EMBA 411",
    u_size = 8,
    u_color = "white",
    u_x = 1
) |> print()

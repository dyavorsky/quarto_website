library(hexSticker)
library(magick)
library(sysfonts)
library(tidyverse)

img <- image_read("_rlogo.png")

sticker(
  subplot = img,
  package = "R Workshop",
  filename = "RWorkshop.png",
  s_width = 1.5,
  s_height = 1.1,
  s_x = 1.0,
  s_y = 0.8,
  p_size = 17,
  h_fill = "#2774AE",
  h_color = "#FFD100",
  h_size = 1.25,
  url = "UCLA MFE",
  u_size = 8,
  u_color = "white",
  u_x = 1.11,
  u_y = 0.16,
  dpi = 300
) |> print()

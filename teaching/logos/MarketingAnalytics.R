library(hexSticker)
library(magick)
library(sysfonts)
library(tidyverse)

img <- image_read("_ai_gen_chart_ucsd_colors.png")

sticker(
    subplot = img,
    package = "Marketing Analytics",
    filename = "MarketingAnalytics.png",
    s_width = 0.9,
    s_height = 0.9,
    s_x = 1,
    s_y = 0.85,
    p_size = 14,
    h_fill = "#182B49",
    h_color = "#FFCD00",
    h_size = 1.25,
    url = "UCSD MGTA 4XX",
    u_size = 8,
    u_color = "white",
    u_x = 1.11,
    u_y = 0.16,
    dpi = 300
) |> print()

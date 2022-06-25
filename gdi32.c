#include <stdio.h>
#include <SDL2/SDL.h>

int GetDeviceCaps(int* hdc, int index) {
  SDL_Rect display_rect;

  if (SDL_GetDisplayBounds(*hdc, &display_rect) == 0) {
    switch (index) {
      /* "Horizontal width of entire desktop in pixels" */
      case 117:
        return display_rect.w;

      /* Vertical height in pixels */
      case 10:
        return display_rect.h;
    }
  }

  return 1;
}

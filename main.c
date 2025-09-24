#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <stdio.h>
#include <stdlib.h>

#define SCREEN_WIDTH 960
#define SCREEN_HEIGHT 540

int main(int argc, const char *argv[]){

    if (argc < 2) {
        printf("Usage : fontViwer3000 <path>\n");
        return EXIT_FAILURE;
    }

    if (SDL_Init(SDL_INIT_VIDEO) < 0){
        printf("Couldn't initialize SDL: %s\n", SDL_GetError());
        return EXIT_FAILURE;
    }

    if (TTF_Init() < 0) {
        printf("SDL_ttf could not initialize! TTF_Error: %s\n", TTF_GetError());
        SDL_Quit();
        return EXIT_FAILURE;
    }

    SDL_Window *window = SDL_CreateWindow("Text Viewer 3000", SDL_WINDOWPOS_UNDEFINED,
                        SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, 0);

    if (!window){
        printf("Failed to open %d x %d window: %s\n", SCREEN_WIDTH, SCREEN_HEIGHT, SDL_GetError());
        TTF_Quit();
        SDL_Quit();
        return EXIT_FAILURE;
    }

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    if (!renderer){
        printf("Failed to create renderer: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        TTF_Quit();
        SDL_Quit();
        return EXIT_FAILURE;
    }

    TTF_Font *font = TTF_OpenFont(argv[1], 32);
    TTF_Font *fontS1 = TTF_OpenFont(argv[1], 24);
    TTF_Font *fontS2 = TTF_OpenFont(argv[1], 16);

    if (!font){
        printf("Failed to load font: %s\n", TTF_GetError());
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        TTF_Quit();
        SDL_Quit();
        return EXIT_FAILURE;
    }

    // PREMIER TEXTE
    SDL_Color textColor1 = {0, 0, 0, 255}; // Noir
    SDL_Surface *textSurface1 = TTF_RenderText_Solid(font, "Portez ce vieux whisky au juge blond qui fume.", textColor1);
    SDL_Texture *textTexture1 = SDL_CreateTextureFromSurface(renderer, textSurface1);
    SDL_Rect textRect1 = {50, 50, textSurface1->w, textSurface1->h}; // Position: (50, 50)

    // DEUXIÈME TEXTE
    SDL_Color textColor2 = {255, 0, 0, 255}; // Rouge
    SDL_Surface *textSurface2 = TTF_RenderText_Solid(fontS1, "Portez ce vieux whisky au juge blond qui fume.", textColor2);
    SDL_Texture *textTexture2 = SDL_CreateTextureFromSurface(renderer, textSurface2);
    SDL_Rect textRect2 = {50, 100, textSurface2->w, textSurface2->h}; // Position: (50, 100)

    // TROISIÈME TEXTE (exemple supplémentaire)
    SDL_Color textColor3 = {0, 0, 255, 255}; // Bleu
    SDL_Surface *textSurface3 = TTF_RenderText_Solid(fontS2, "Portez ce vieux whisky au juge blond qui fume.", textColor3);
    SDL_Texture *textTexture3 = SDL_CreateTextureFromSurface(renderer, textSurface3);
    SDL_Rect textRect3 = {50, 150, textSurface3->w, textSurface3->h}; // Position: (50, 150)

    // Libération des surfaces (les textures sont conservées)
    SDL_FreeSurface(textSurface1);
    SDL_FreeSurface(textSurface2);
    SDL_FreeSurface(textSurface3);

    // Boucle d'événements principale
    int quit = 0;
    SDL_Event event;

    while (!quit) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                quit = 1;
            }
            if (event.type == SDL_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_ESCAPE) {
                    quit = 1;
                }
            }
        }

        // Rendu
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_RenderClear(renderer);

        // Affichage des trois textes
        SDL_RenderCopy(renderer, textTexture1, NULL, &textRect1);
        SDL_RenderCopy(renderer, textTexture2, NULL, &textRect2);
        SDL_RenderCopy(renderer, textTexture3, NULL, &textRect3);

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    }

    // Nettoyage
    SDL_DestroyTexture(textTexture1);
    SDL_DestroyTexture(textTexture2);
    SDL_DestroyTexture(textTexture3);
    TTF_CloseFont(font);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    TTF_Quit();
    SDL_Quit();

    return EXIT_SUCCESS;
}

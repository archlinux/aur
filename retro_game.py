import os
# Скрываем предупреждение Pygame об AVX2 / поддержке до инициализации
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'

import pygame
import sys
import array
import json
import random

pygame.init()
pygame.mixer.init(frequency=22050, size=-16, channels=1)

TILE_SIZE = 16
GRID_WIDTH, GRID_HEIGHT = 16, 12
GAME_WIDTH = GRID_WIDTH * TILE_SIZE
GAME_HEIGHT = GRID_HEIGHT * TILE_SIZE

SCALE = 3 
WINDOW_WIDTH = GAME_WIDTH * SCALE
WINDOW_HEIGHT = GAME_HEIGHT * SCALE

screen = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
pygame.display.set_caption("2-micro-Platformer-1982")
clock = pygame.time.Clock()

COLOR_BG = (15, 15, 27)        
COLOR_WALL = (80, 85, 95)       
COLOR_COIN = (200, 200, 210)    
COLOR_PLAYER = (50, 220, 110)   

LEVEL_MAP = []
current_level = 1
player_tile_x = 8
player_tile_y = 2
is_jumping = False
jump_stage = 0
JUMP_PATTERN = [-1, -1, -1, -1, 0, 0, 1, 1, 1, 1] 
score = 0
max_coins = 5
total_score = 0
enemies = []

CONFIG_DIR = os.path.expanduser("~/.config")
SAVE_FILE = os.path.join(CONFIG_DIR, "2-micro-platformer-1982-highscore.json")
high_score = 0

def load_highscore():
    global high_score
    try:
        if os.path.exists(SAVE_FILE):
            with open(SAVE_FILE, 'r') as f:
                high_score = json.load(f).get("highscore", 0)
    except Exception: 
        high_score = 0

def save_highscore(new_score):
    global high_score
    if new_score > high_score:
        high_score = new_score
        try:
            with open(SAVE_FILE, 'w') as f: 
                json.dump({"highscore": high_score}, f)
            return True
        except Exception: 
            pass
    return False

load_highscore()

# ФИЧА: Процедурный генератор уровней
def generate_procedural_level():
    global LEVEL_MAP, enemies, player_tile_x, player_tile_y, score
    score = 0  # ЖЕЛЕЗНО ИСПРАВЛЕНО: Счётчик уровня теперь сбрасывается!
    
    # Заполняем пустотой
    LEVEL_MAP = [[0 for _ in range(GRID_WIDTH)] for _ in range(GRID_HEIGHT)]
    
    # Стены вокруг
    for r in range(GRID_HEIGHT):
        for c in range(GRID_WIDTH):
            if r == 0 or r == GRID_HEIGHT - 1 or c == 0 or c == GRID_WIDTH - 1:
                LEVEL_MAP[r][c] = 1

    # Генерируем случайные этажи/платформы
    floors = [4, 7, 10]
    for f_row in floors:
        gap_start = random.randint(2, GRID_WIDTH - 5)
        gap_len = random.randint(2, 3)
        for c in range(1, GRID_WIDTH - 1):
            if f_row == 10 and gap_start <= c < gap_start + gap_len:
                continue 
            if f_row != 10 and random.random() > 0.75:
                continue 
            LEVEL_MAP[f_row][c] = 1

    # Безопасный спавн игрока под потолком
    player_tile_x, player_tile_y = 8, 2
    LEVEL_MAP[player_tile_y][player_tile_x] = 0

    # Спавн кристаллов (5 штук на платформах)
    coins_spawned = 0
    while coins_spawned < max_coins:
        rx = random.randint(1, GRID_WIDTH - 2)
        ry = random.randint(1, GRID_HEIGHT - 2)
        if LEVEL_MAP[ry][rx] == 0 and LEVEL_MAP[ry + 1][rx] == 1 and (rx, ry) != (player_tile_x, player_tile_y):
            LEVEL_MAP[ry][rx] = 2
            coins_spawned += 1

    # Спавн врагов (количество растет с уровнем)
    enemies = []
    num_enemies = min(4, 1 + current_level // 2)
    for _ in range(num_enemies):
        attempts = 0
        while attempts < 50:
            rx = random.randint(2, GRID_WIDTH - 3)
            ry = random.randint(3, GRID_HEIGHT - 2)
            if LEVEL_MAP[ry][rx] == 0 and LEVEL_MAP[ry+1][rx] == 1 and ry != player_tile_y:
                enemies.append([rx, ry, random.choice([-1, 1]), rx - 2, rx + 2])
                break
            attempts += 1

def generate_beep_sound(frequency, duration_ms):
    sample_rate = 22050
    num_samples = int(sample_rate * (duration_ms / 1000.0))
    buf = array.array('h', [0] * num_samples)
    for i in range(num_samples):
        t = float(i) / sample_rate
        buf[i] = 16000 if (int(2.0 * frequency * t) % 2 == 0) else -16000
    return pygame.mixer.Sound(buffer=buf)

sound_jump = generate_beep_sound(150, 80)
sound_coin = generate_beep_sound(600, 120)
sound_death = generate_beep_sound(80, 300)
sound_win = generate_beep_sound(440, 400)
sound_highscore = generate_beep_sound(880, 500)

font = pygame.font.Font(None, 20)
game_state = 'MENU'
menu_timer = 0

while True:
    menu_timer += 1
    clock.tick(10)
    
    for event in pygame.event.get():
        if event.type == pygame.QUIT: 
            sys.exit()
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE: 
                sys.exit()
            if game_state == 'MENU' and event.key == pygame.K_SPACE:
                current_level = 1
                total_score = 0
                generate_procedural_level()
                game_state = 'GAME'
            elif game_state == 'WIN_SCREEN' and event.key == pygame.K_SPACE:
                current_level += 1
                generate_procedural_level()
                game_state = 'GAME'

            elif game_state == 'GAME':
                step = 2 if (pygame.key.get_mods() & pygame.KMOD_SHIFT) else 1
                if event.key in [pygame.K_LEFT, pygame.K_a]:
                    tx = max(1, player_tile_x - step)
                    if LEVEL_MAP[player_tile_y][tx] != 1: 
                        player_tile_x = tx
                elif event.key in [pygame.K_RIGHT, pygame.K_d]:
                    tx = min(GRID_WIDTH - 2, player_tile_x + step)
                    if LEVEL_MAP[player_tile_y][tx] != 1: 
                        player_tile_x = tx
                if event.key in [pygame.K_SPACE, pygame.K_w, pygame.K_UP]:
                    if player_tile_y + 1 < GRID_HEIGHT and LEVEL_MAP[player_tile_y + 1][player_tile_x] == 1:
                        is_jumping, jump_stage = True, 0
                        sound_jump.play()

    if game_state == 'GAME':
        if is_jumping:
            ny = player_tile_y + JUMP_PATTERN[jump_stage]
            if 0 <= ny < GRID_HEIGHT and LEVEL_MAP[ny][player_tile_x] != 1: 
                player_tile_y = ny
            else:
                if JUMP_PATTERN[jump_stage] < 0: 
                    jump_stage = 4
            jump_stage += 1
            if jump_stage >= len(JUMP_PATTERN): 
                is_jumping = False
        else:
            if player_tile_y + 1 < GRID_HEIGHT and LEVEL_MAP[player_tile_y + 1][player_tile_x] != 1:
                player_tile_y += 1
            elif player_tile_y + 1 >= GRID_HEIGHT: 
                sound_death.play()
                if save_highscore(total_score): 
                    sound_highscore.play()
                game_state = 'MENU'

        if menu_timer % 2 == 0:
            for e in enemies:
                nx = e[0] + e[2]
                if nx < e[3] or nx > e[4] or LEVEL_MAP[e[1]][nx] == 1: 
                    e[2] = -e[2]
                else: 
                    e[0] = nx

        for e in enemies:
            if player_tile_x == e[0] and player_tile_y == e[1]:
                sound_death.play()
                if save_highscore(total_score): 
                    sound_highscore.play()
                game_state = 'MENU'

        if LEVEL_MAP[player_tile_y][player_tile_x] == 2:
            LEVEL_MAP[player_tile_y][player_tile_x] = 0
            score += 1
            total_score += 1
            sound_coin.play()
            if score >= max_coins:
                sound_win.play()
                game_state = 'WIN_SCREEN'

    # Рендеринг
    game_surface = pygame.Surface((GAME_WIDTH, GAME_HEIGHT))
    game_surface.fill(COLOR_BG)

    if game_state == 'MENU':
        game_surface.blit(font.render("PROCEDURAL RETRO 1982", True, COLOR_PLAYER), (35, 40))
        game_surface.blit(font.render(f"HI-SCORE: {high_score}", True, COLOR_COIN), (65, 70))
        if (menu_timer // 5) % 2 == 0:
            game_surface.blit(font.render("PRESS SPACE TO START", True, COLOR_COIN), (45, 105))
    elif game_state == 'WIN_SCREEN':
        game_surface.blit(font.render("LEVEL COMPLETE!", True, COLOR_PLAYER), (65, 40))
        game_surface.blit(font.render(f"CURRENT SCORE: {total_score}", True, COLOR_COIN), (55, 70))
        game_surface.blit(font.render("PRESS SPACE TO CONTINUE", True, COLOR_PLAYER), (25, 110))
    elif game_state == 'GAME':
        for r in range(GRID_HEIGHT):
            for c in range(GRID_WIDTH):
                if LEVEL_MAP[r][c] == 1:
                    pygame.draw.rect(game_surface, COLOR_WALL, (c*16, r*16, 16, 16))
                    pygame.draw.rect(game_surface, COLOR_BG, (c*16, r*16, 16, 16), 1)
                elif LEVEL_MAP[r][c] == 2:
                    pygame.draw.polygon(game_surface, COLOR_COIN, [(c*16+8, r*16+3), (c*16+13, r*16+8), (c*16+8, r*16+13), (c*16+3, r*16+8)])
        for e in enemies:
            pygame.draw.rect(game_surface, COLOR_WALL, (e[0]*16+2, e[1]*16+2, 12, 12))
            pygame.draw.rect(game_surface, COLOR_COIN, (e[0]*16+4, e[1]*16+4, 8, 4))
        pygame.draw.rect(game_surface, COLOR_PLAYER, (player_tile_x*16+4, player_tile_y*16+2, 8, 12))
        pygame.draw.rect(game_surface, COLOR_BG, (player_tile_x*16+6, player_tile_y*16+4, 4, 2))
        
        turbo = " [TURBO]" if (pygame.key.get_mods() & pygame.KMOD_SHIFT) else ""
        game_surface.blit(font.render(f"LVL {current_level} SCORE: {total_score}{turbo}", True, COLOR_COIN), (8, 6))

    scaled = pygame.transform.scale(game_surface, (WINDOW_WIDTH, WINDOW_HEIGHT))
    for y in range(0, WINDOW_HEIGHT, 3):
        pygame.draw.line(scaled, (5, 5, 10), (0, y), (WINDOW_WIDTH, y))
    screen.blit(scaled, (0, 0))
    pygame.display.flip()

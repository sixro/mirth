#include "ui.h"

#include "raylib.h"

const int screenWidth = 800;
const int screenHeight = 450;

void ui_init() {
    InitWindow(screenWidth, screenHeight, "Mirth");

    SetTargetFPS(60);
}

void ui_loop() {
	Image character = LoadImage("./asset/mirth_character.png");
	Texture2D texture = LoadTextureFromImage(character);
	UnloadImage(character);

    while (!WindowShouldClose())
    {
		/*
         * Update
         * TODO: Update your variables here
		 */

        /* Draw */
        BeginDrawing();

            ClearBackground(RAYWHITE);

			DrawRectangle(screenWidth/4*2 - 60, 100, 120, 60, RED);
			DrawCircle(screenWidth/5, 120, 35, DARKBLUE);
			DrawTexture(texture, screenWidth/2 - texture.width/2, screenHeight/2 - texture.height/2 - 40, WHITE);

            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);

        EndDrawing();
    }

	UnloadTexture(texture);
}

void ui_close() {
    CloseWindow();
}

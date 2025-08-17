#include "ui.h"

#include "raylib.h"

void ui_init() {
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");

    SetTargetFPS(60);
}

void ui_loop() {
    while (!WindowShouldClose())
    {
		/*
         * Update
         * TODO: Update your variables here
		 */

        /* Draw */
        BeginDrawing();

            ClearBackground(RAYWHITE);

            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);

        EndDrawing();
    }
}

void ui_close() {
    CloseWindow();
}

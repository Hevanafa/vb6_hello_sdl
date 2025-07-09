VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private SDL2 As New cSDL2
Dim done As Boolean

'Sub Cls()
'  SDL2.SetRenderDrawColor sdlRenderer, &H64, &H95, &HED, &HFF
'  SDL2.RenderClear sdlRenderer
'End Sub

Private Sub Form_Load()
  ' MsgBox "Hello VB6!"
  Me.Hide
  
  done = False
  
  SDL2.Init2 SDL_INIT_VIDEO
  
  Dim sdlWindow As Long, sdlRenderer As Long
  Dim eType As SDL_EventType
  Dim mEvent As Long
  
  sdlWindow = SDL2.CreateWindow("Hello SDL2!", 640, 480, SDL_WINDOW_SHOWN)
  sdlRenderer = SDL2.CreateRenderer(sdlWindow, -1, SDL_RENDERER_ACCELERATED Or SDL_RENDERER_PRESENTVSYNC)
  
  While Not done
    Cls
    
    ' TODO: Your update logic here
    SDL2.PollEvent eType
    
    If eType = SDL_QUIT Then done = True
      
    ' This crashes the IDE for some reason:
    ' SDL2.RefreshKeyStates
    ' If SDL2.IsDown(SDL_SCANCODE_ESCAPE) Then _
      ' done = True
      
    ' TODO: Your drawing code here
    SDL2.SetRenderDrawColor sdlRenderer, &H64, &H95, &HED, &HFF
    SDL2.RenderClear sdlRenderer
    
    ' flush
    SDL2.RenderPresent sdlRenderer
  Wend
  
  ' SDL2.Delay 3000
  
  SDL2.DestroyRenderer sdlRenderer
  SDL2.DestroyWindow sdlWindow
  SDL2.Quit
  
  ' Close this form
  Unload Me
End Sub

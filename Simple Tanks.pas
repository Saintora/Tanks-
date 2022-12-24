uses graphABC;
label fin;
var
  x, y, finish, fire, sx, sy, a, b: integer;
  storona, shag, dx, dy:integer;
  fireBot, firePauseShag, sx2, sy2:integer;
  PlayerCount, BotCount:integer;
  PopalBotShag, PopalBotX, PopalBotY:integer;
  PopalPlayerShag, PopalPlayerX, PopalPlayerY:integer;


procedure DrawIntro(x, y, x1, y1:integer;i:byte ;s:string;cl: color);//интерфейс
begin
  setbrushcolor(cl);//линии отделяющие левое поле от правого
  pen.Width:=9;
  setpencolor(clyellowgreen);
  line (425,0,425,50);
  line (425,60,425,100);
  line (425,110,425,150);
  line (425,160,425,200);
  line (425,210,425,250);
  line (425,260,425,300);
  line (425,310,425,350);
  line (425,360,425,400);
  line (425,410,425,450);
  line (425,460,425,500);
  line (425,510,425,550);
  line (425,560,425,600);
  line (425,610,425,650);
  line (425,660,425,700);
  line (425,710,425,750);
  setbrushcolor(cldimgray);
  {fillroundrect(425,0,436,690,2,2);}
  setbrushcolor(cl);
setfontcolor(cldimgray);
setfontsize(15);
s:='BORDER';
for i:=1 to length(s) do
    textout(439,i*30,s[i]);
    setbrushcolor(cldimgray);
fillrect(0,650,1024,696);


  
  //FillRect(x, y, x1, y1);//белое поле боя
  setbrushcolor(clspringgreen);
  FillRoundRect(220, 660, 250, 690, 15, 15);//значки для обозначения на интерфейсе
  setbrushcolor(cllightskyblue);
  FillRoundRect(325, 660, 355, 690, 15, 15);
  
  
  
end;

procedure DrawInstruction(x, y, x1, y1: integer; cl1: color; cl2: color);
begin
  
  SetBrushColor(cl1);
  Setpencolor(cl2);
  FillRoundRect(x + 830, y + 85, x1 + 885, y1 + 145, 15, 5);
  line(x + 830, y + 86, x1 + 844, y1 + 105);
  
  line(x + 883, y + 86, x1 + 875, y1 + 107);
  
  line(x + 874, y + 134, x1 + 884, y1 + 144);
  
  line(x + 830, y + 144, x1 + 849, y1 + 133);
  SetBrushColor(cl2);
  FillRoundRect(x + 840, y + 100, x1 + 880, y1 + 140, 15, 5);
  
end;

procedure DrawInstruction2(x, y, x1, y1: integer; cl1: color; cl2: color);//пробел + граница
begin
  
  SetBrushColor(cl1);
  Setpencolor(cl2);
  FillRoundRect(x + 830, y + 85, x1 + 885, y1 + 145, 15, 5);
  
  SetBrushColor(cl2);
  FillRoundRect(x + 840, y + 100, x1 + 880, y1 + 140, 15, 5);
  
  
  
  SetPenColor(cl1);//белые линии отделяющая середину интерфейса
  SetPenWidth(-3);
  
  
end;

procedure DrawText(x, y, sz: integer; s: string; cl1: color; cl2: color);//text
begin
  
  setbrushcolor(cl1);
  SetFontColor(cl2);
  SetFontSize(sz);
  textout(x, y, s);
end;




procedure DrawTank(x1, y1, x2, y2: integer; cl: color);//модель твоего танка
begin
  Setbrushcolor(cllightgray);
  FillEllipse(x1 - 10, y1, x2 + 105, y2 + 50);//тень
  
  Setbrushcolor(cl);
  
  FillCircle(x1 + 40, y1 - 4, 25);//башня
  FillRoundRect(x1 + 50, y1 - 20, x1 + 120, y1 - 10, 5, 5);//пушка
  FillRoundRect(x1, y1, x1 + 100, y1 + 35, 20, 20);//корпус
  
  Setbrushcolor(clgray);
  
  FillRoundRect(x1 + 100, y1 - 21, x1 + 121, y1 - 9, 5, 5);//конец пушки
  
  FillRoundRect(x1 + 5, y1 + 5, x1 + 95, y1 + 30, 25, 25);//гусеница
  
  setpencolor(clgray);
  Arc(x + 38, y - 4, 25, 0, 59);//дуга на башне(дульный срез)
  setPenWidth(3);          
  
  
  
  
  Setbrushcolor(clwhite);//колёса
  FillCircle(x1 + 20, y1 + 17, 7);
  FillCircle(x1 + 40, y1 + 17, 7);
  FillCircle(x1 + 60, y1 + 17, 7);
  FillCircle(x1 + 80, y1 + 17, 7);
  
end;





procedure DrawEnemyTank(a1, b1, a2, b2: integer; cl: color);//модель вражеского танка
begin
  setbrushcolor(cllightgray);
  FillEllipse(a1 - 5, b1, a2 + 110, b2 + 50);//тень
  
  setbrushcolor(cl);
  
  FillCircle(a1 + 60, b1 - 4, 25);//башня
  FillRoundRect(a + 50, b1 - 20, a1 - 20, b1 - 10, 5, 5);//пушка
  FillRoundRect(a1, b1, a1 + 100, b1 + 35, 20, 20);//корпус
  
  setbrushcolor(clgray);
  
  FillRoundRect(a1 - 1, b1 - 21, a1 - 21, b1 - 9, 5, 5);//конец пушки
  FillRoundRect(a1 + 5, b1 + 5, a1 + 95, b1 + 30, 25, 25);//гусеница
  
  setpencolor(clgray);
  setPenWidth(3);          
  Arc(a + 62, b - 4, 25, 121, 179);//дуга на башне(дульный срез)
  
  
  Setbrushcolor(clwhite);//колёса
  FillCircle(a1 + 20, b1 + 17, 7);
  FillCircle(a1 + 40, b1 + 17, 7);
  FillCircle(a1 + 60, b1 + 17, 7);
  FillCircle(a1 + 80, b1 + 17, 7);
  
end;

procedure DrawBullet(x1, y1: integer; cl: color);//модель снаряда
begin
  
  
  
         //первая модель
         ///setbrushcolor(clgray);
         ///FillEllipse(x1-10,y1-6,x1+16,y1+7);
  
  
         ///line(x1-10,y1-3,x1,y1);//треугольник слева
         ///line(x1-10,y1+3,x1,y1);//
  
  
  
  
         ///setbrushcolor( clyellow );
         ///FillPie (x1+10,y1,6,0,360);
         ///Arc (x1+11,y1,6,0,360);
  
         //ниже находится вторая модель
  setpencolor(clorange);
  
  
  
  line(x1 - 10, y1 - 3, x1 + 10, y1 - 6);//вверх
  line(x1 - 10, y1 + 3, x1 + 10, y1 + 6);//вниз
  
  
  line(x1 - 10, y1 - 3, x1, y1);//треугольник слева
  line(x1 - 10, y1 + 3, x1, y1);//
  
  
  
  
  setbrushcolor( clyellow );
  FillPie(x1 + 10, y1, 6, 0, 360);
  Arc(x1 + 11, y1, 6, 0, 360);
  
  
  
  
end;

procedure DrawEnemyBullet(x1, y1: integer; cl: color);//модель снаряда
begin
  
  
  
         //первая модель
         ///setbrushcolor(clgray);
         ///FillEllipse(x1-10,y1-6,x1+16,y1+7);
  
  
         ///line(x1-10,y1-3,x1,y1);//треугольник слева
         ///line(x1-10,y1+3,x1,y1);//
  
  
  
  
         ///setbrushcolor( clyellow );
         ///FillPie (x1+10,y1,6,0,360);
         ///Arc (x1+11,y1,6,0,360);
  
         //ниже находится вторая модель
  setpencolor(clorange);
  
  
  
  line(x1 + 10, y1 + 3, x1 - 10, y1 + 6);//вверх
  line(x1 + 10, y1 - 3, x1 - 10, y1 - 6);//вниз
  
  
  line(x1 + 10, y1 + 3, x1, y1);//треугольник слева
  line(x1 + 10, y1 - 3, x1, y1);//
  
  
  
  
  setbrushcolor( clyellow );
  FillPie(x1 - 10, y1, 6, 0, 360);
  Arc(x1 - 11, y1, 6, 0, 360);
  
  
  
  
end;




procedure DrawDead(xx,yy: integer);
begin
Setbrushcolor(clRed);
  FillCircle(xx, yy, 100);
  Setbrushcolor(clorange);
  FillCircle(xx,yy,70);
  Setbrushcolor(clyellow);
  FillCircle(xx,yy,50);
  Setbrushcolor(cllightyellow);
  FillCircle(xx,yy,25);
end;





procedure KeyDown(key: integer);
begin
  if key = vk_A then
  begin
    if x >= 1 then x := x - 5;
  end;
  if key = vk_D then
  begin
    if x < 300  then x := x + 5;
  end;
  if key = vk_W then
  begin
    if y > 35 then y := y - 5;
  end;
  if key = vk_S then
  begin
    if y < 600 then y := y + 5;
  end;
  
  if key = vk_space then
  begin
    if fire = 0 then
    begin
      fire := 1;
      sx := x + 125;
      sy := y - 16;
    end;
  end;
  
  if key = vk_escape then
  begin
    MinimizeWindow;
    
    finish := 1;
    CloseWindow;
  end;
end;


procedure DrawPopal(xx,yy:integer);//эффект попадания
begin
  Setbrushcolor(clRed);
  FillCircle(xx, yy, 30);
  Setbrushcolor(clorange);
  FillCircle(xx,yy,20);
  Setbrushcolor(clyellow);
  FillCircle(xx,yy,10);
  Setbrushcolor(cllightyellow);
  FillCircle(xx,yy,5);
end;


begin
  
  
  
   SetWindowWidth(1024);
  SetWindowHeight(696);
  Window.Title := 'Simple Tanks';
  
  CenterWindow;
  SetWindowTop(0);
  
  
  lockdrawing;
  
  x := 20;y := 150;//изначальное положение твоего танка
  a := 680;b := 540;//изначальное положение вражеского танка
  
  OnKeyDown := KeyDown;
  finish := 0; fire := 0;    
  repeat
    
    
    DrawIntro(0, 0, 800, 715,10,'s',clwhite);//белая платформа
    DrawText(260,660,20,'YOU',cldimgray,cllightgray);
    DrawText(364,660,20,'AI',cldimgray,cllightgray);
        DrawText(510,650,30,'Simple',cldimgray,clgreenyellow{greenyellow});
        DrawText(640,650,30,'Tanks',cldimgray,cllightgray);
        //DrawText(900,650,10,'made by:',cldimgray,cllightgray);
        //DrawText(845,670,10,'supported by:',cldimgray,cllightgray);
        //DrawText(960,650,10,'Dmitry A.',cldimgray,clyellowgreen);
        //DrawText(935,673,10,'Aibek  D.',cldimgray,clskyblue);
    
    
    //DrawText(880, 440, 35, 'Simple', clyellowgreen, clsnow);//первый cl это цвет заднего фона
    
    //DrawText(800, 500, 43, 'Obterere', clyellowgreen, clsnow);
    
    DrawText(10, 660, 20, 'SCORE: ', cldimgray, cllightgray);
    DrawText(120, 660, 20, ''+inttostr(PlayerCount), cldimgray, clspringgreen);
    DrawText(150, 659, 20, '|', cldimgray, cllightgray);
    DrawText(155, 660, 20, ' '+ inttostr(BotCount), cldimgray, clskyblue);
    
    
    
    //DrawInstruction(0, 0, 0, 0, clwhite, cldimgray);//design keyboard key A
    //DrawInstruction(+60, -65, +60, -65, clwhite, cldimgray);//design keyboard key W
    //DrawInstruction(+60, 0, +60, 0, clwhite, cldimgray);//design keyboard key S
    //DrawInstruction(+120, 0, +120, 0, clwhite, cldimgray);//design keyboard key D
    //DrawInstruction2(0, +85, +15, +50, clwhite, cldimgray);//design keyboard key space
    
    
    //DrawText(854, 110, 14, 'A', cldimgray, clwhite);//letter A
    //DrawText(911, 44, 14, 'W', cldimgray, clwhite);//letter W
    //DrawText(914, 110, 14, 'S', cldimgray, clwhite);//letter S
    //DrawText(974, 110, 14, 'D', cldimgray, clwhite);//letter D
    //DrawText(910, 162, 20, 'space', cldimgray, clwhite);//letter space
    //DrawText(880, 255, 20, 'You', cldimgray, clsnow);
    //DrawText(880, 305, 20, 'AI', cldimgray, clsnow);
    
    DrawEnemyTank(a, b, a, b, cllightskyblue);
    
    //Shag bota
    if shag = 0 then
    begin
      shag := random(50);
      storona := random(2);
      dx := (random(11) - 5);
      dy := (random(11) - 5);
    end else
    begin
      shag := shag - 1;
      if storona = 1 then 
      begin
        if ((a + dx)<930 )and((a+dx)>{300}450 ) then a := a + dx else shag:=0;
      end
      else 
      begin
        if ((b + dy)<600)and((b+dy)>30) then b := b + dy else shag:=0;
      end;
    end;
    //KONETS Shaga bota
    
    //Fire bot
    if firePauseShag=0 then
    begin
      if fireBot=0 then
      begin
        fireBot := 1;
        sx2 := a-20 ;
        sy2 := b - 16;
      end else
      begin
        sx2:=sx2 - 15;
        DrawEnemyBullet(sx2, sy2, clrandom);
        
        //Popal bot
        if (sx2>=x)and(sx2<=x+100)and(sy2>=y)and(sy2<=y+35) OR
           (sx2>=x+15)and(sx2<=x+65)and(sy2>=y-29)and(sy2<=y+21)
        then
        begin
          fireBot:=0;;firePauseShag:=0;
          BotCount:=BotCount+1;
          PopalBotShag:=5;
          PopalBotX:=sx2; 
          PopalBotY:=sy2;
        end;
        
      end;
      if sx2 <= 0 then begin fireBot := 0; firePauseShag:=50; end;
    end else
    begin
      firePauseShag:=firePauseShag-1;
    end;
    //KONETS Fire bot
    
    DrawTank(x, y, x, y, cllightgreen);
    
    
    if PopalBotShag>0 then
    begin
      PopalBotShag:=PopalBotShag -1;
      DrawPopal(PopalBotX,PopalBotY);
    end;
    if PopalPlayerShag>0 then
    begin
      PopalPlayerShag:=PopalPlayerShag-1;
      DrawPopal(PopalPlayerX,PopalPlayerY);
    end;    
    
    
    if fire = 1 then 
    begin
      sx := sx + 15;
      DrawBullet(sx, sy, clrandom);
      //Popal Player
      if (sx>=a)and(sx<=a+100)and(sy>=b)and(sy<=b+35) OR
         (sx>=a+15)and(sx<=a+65)and(sy>=b-29)and(sy<=b+21)
      then
      begin
        fire:=0;;
        PlayerCount:=PlayerCount+1;
        PopalPlayerShag:=5;
        PopalPlayerX:=sx;
        PopalPlayerY:=sy;
      end;
    end;
    
    redraw;
    sleep(1);//убрал,потому что это задержка,а не ускоритель
    if sx > 990 then fire := 0;
    
    if (PlayerCount >=10) then
    
    begin
    DrawDead(PopalPlayerX,PopalPlayerY);
      finish:=1; goto fin;
    end;
    if(BotCount>=10) then
    begin
    DrawDead(PopalBotX,PopalBotY);
      finish:=1; goto fin;
    end;
    
    clearwindow(clwhite);
  until finish = 1;

fin:
  DrawText(800, 110, 20, ' GAME OVER! ', cldimgray, clwhite);
  if PlayerCount>BotCount then DrawText(630, 150, 50, ' Player wins ', cldimgray, clyellowgreen); 
  if PlayerCount<BotCount then DrawText(755, 150, 50, ' Ai wins ', cldimgray, clyellowgreen);
  if PlayerCount=BotCount then DrawText(800, 150, 50, ' Draw ', cldimgray, clyellowgreen);
  Redraw;
end.

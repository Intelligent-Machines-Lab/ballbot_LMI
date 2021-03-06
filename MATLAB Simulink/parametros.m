
% -------------------------------------------
% Linearização do modelo nao linear do ballbot
% Autor:  Pedro Henrique de Jesus
% 18/08/2020
% -------------------------------------------

clear all

% Variaveis simbólicas para o modelo não linear 
syms u x1 x2 x3 x4 s

% Onde: u=aceleração angular na roda
%       x1=Theta, x2=ThetaP, x3=x, x4=xP     

% Parâmetros
g  = 9.81 ;   % [m/s^2] Aceleração da gravidade 
Mc = 1.6;     % [kg] Massa do corpo
Mr = 0.5  ;   % [kg] Massa da roda
L  = 0.2;     % [m] Comprimento da roda ao CG do corpo
r = 0.12  ;   % [m] Raio da roda
Ic = 0.024;   % [kgm^2] Momento de Inércia do corpo
Ir = 0.0033;  % [kgm^2] Momento de Inércia da roda
 
% Equações diferenciais
f1= x2;
f2 = ( -(Ic+((Mc+Mr)*r*r)+Mc*L*r*cos(x1))*u + Mc*g*L*sin(x1)+Mc*r*L*x2*x2*sin(x1))/ (Ic+Mc*(L*L)+Mc*L*r*cos(x1)) ;
f3= x4;
f4=-r*u;

% ( -(Ic+((Mc+Mr)*r*r)+Mc*L*r*cos(u(3)))*u(1) + Mc*g*L*sin(u(3))+Mc*r*L*u(2)*u(2)*sin(u(3)))/ (Ic+Mc*(L*L)+Mc*L*r*cos(u(3))) ;


% Linearização do modelo

a=jacobian([f1,f2,f3,f4],[x1,x2,x3,x4]);
a=subs(a,x1,0);
a=subs(a,x2,0);
a=subs(a,u,0);

b=jacobian([f1,f2,f3,f4],[u]);
b=subs(b,x1,0);
b=subs(b,x2,0);
b=subs(b,u,0);

% Matriz do modelo em espaço de estados
A=[a(1,1),a(1,2),a(1,3),a(1,4);
   a(2,1),a(2,2),a(2,3),a(2,4);
   a(3,1),a(3,2),a(3,3),a(3,4);
   a(4,1),a(4,2),a(4,3),a(4,4)];

B=[b(1);b(2);b(3);b(4)];
C= diag([1,1,1,1]); 
D=[0];

% Converter o simbólico com frações para números (do tipo double)
A=double(A);B=double(B);

% Para converter de SS para FT
% G=C*inv(s*eye(4)-A)*B+D; 

Q=1*eye(4);
Q(1,1)=50;
Q(2,2)=20;
Q(3,3)=10;
Q(4,4)=20;
R=50;

[K,S,e] = lqr(A,B,Q,R);
K
% FT   = Tetha / Aceleração
num1=Ir+((Mc+Mr)*r*r)+Mc*L*r;
den1= [ -(Ic+Mc*(L*L)+Mc*L*r),0,Mc*L*g ];
Gp=tf(num1,den1);
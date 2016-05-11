JsOsaDAS1.001.00bplist00�Vscripto� / /   T h i s   e x a m p l e   l o a d s   s c r i p t   " P a s h u a J S . s c p t "   ( t o   b e   c o m p i l e d   f r o m   " P a s h u a J S . a p p l e s c r i p t " )   f r o m 
 / / 
 / / 	 	 ~ / L i b r a r y / S c r i p t   L i b r a r i e s 
 / / 
 / / 	 	 T o   v i e w   t h i s   f o l d e r ,   c h o o s e   t h e   F i n d e r ' s   G o   m e n u ,   h o l d   d o w n   t h e   o p t i o n   k e y ,   a n d   c h o o s e   L i b r a r y 
 / / 	 	 t h e n   b r o w s e   t o   t h e   S c r i p t   L i b r a r i e s   f o l d e r 
 / / 
 / / 	 	 S e e   t h e   s e c t i o n   o n   L i b r a r y   i n   A p p l e ' s   J a v a S c r i p t   f o r   A u t o m a t i o n   R e l e a s e   N o t e s   ( 1 0 . 1 0   s e c t i o n ) 
 / / 	 	 h t t p s : / / d e v e l o p e r . a p p l e . c o m / l i b r a r y / m a c / r e l e a s e n o t e s / I n t e r a p p l i c a t i o n C o m m u n i c a t i o n / R N - J a v a S c r i p t F o r A u t o m a t i o n 
 / / 
 / /   P a s h u a J S . s c p t   h a n d l e s   t h e   c o m m u n i c a t i o n   w i t h   P a s h u a . a p p   w h i c h ,   f o r   t h i s   t e s t     s h o u l d   b e 
 / /   i n   a   s y s t e m   o r   u s e r   A p p l i c a t i o n s   f o l d e r 
 / /   Y o u   c a n   e i t h e r   t a k e   t h e   h a n d l e r s   o u t   o f   P a s h u a . s c p t   a n d   u s e   t h e m   i n l i n e   w h e n e v e r   y o u   w r i t e 
 / /   a   s c r i p t   w h i c h   u s e s   P a s h u a ,   u s e   P a s h u a J S . s c p t   a s   a   J a v a S c r i p t   f o r   A u t o m a t i o n   L i b r a r y   ( O S   X   1 0 . 1 0   o r   n e w e r ) 
 / /   o r   u s e   t h e   ` v a r   P a s h u a   =   L i b r a r y ( ' P a s h u a J S ' ) `   a p p r o a c h   u s e d   i n   t h i s   f i l e . 
 
 / /   T H I S   E X A M P L E   U S E S   t h e   P a s h u a . w r i t e C o n f i g ( )   f u n c t i o n   t o   g e n e r a t e   P a s h u a   c o n f i g   s n i p p e t s 
 / /   f r o m   J a v a S c r i p t   o b j e c t s   o r   a r r a y s   o f   o b j e c t s ,   i n t e r l e a v i n g   t h e s e   w i t h   t h e   P a s h u a   c o n f i g   t e x t . 
 
 / /   G e n e r a t i n g   P a s h u a   c o n f i g   t e x t   a t   r u n   t i m e   m a y   b e   u s e f u l ,   f o r   e x a m p l e ,   f o r   p o p u l a t i n g   d i a l o g   o p t i o n   l i s t s . 
 
 v a r   P a s h u a   =   L i b r a r y ( ' P a s h u a J S ' ) ; 
 
 v a r   l i s t A   =   [ " a l p h a " ,   " b e t a " ,   " g a m m a " ] , 
 	 l i s t B   =   [ " d e l t a " ,   " e p s i l o n " ,   " z e t a " ] ; 
 
 v a r   s t r C o n f i g   =   ' #   S e t   w i n d o w   t i t l e   \ n \ 
 * . t i t l e   =   W e l c o m e   t o   P a s h u a   \ n \ 
   \ n \ 
 #   R u n - t i m e   i n f o   \ n \ 
 i n f . t y p e   =   t e x t   \ n \ 
 i n f . d e f a u l t   =   D i a l o g   g e n e r a t e d   f r o m   a   m i x t u r e   o f   P a s h u a   C o n f i g   t e x t ,   a n d   o n e   o r   m o r e   J a v a S c r i p t   f o r   A u t o m a t i o n   o b j e c t s . [ r e t u r n ] [ r e t u r n ] '   +   n e w   D a t e ( )   +   ' \ n \ 
 i n f . h e i g h t   =   5 0   \ n \ 
 i n f . w i d t h   =   3 1 0   \ n \ 
 i n f . x   =   3 4 0   \ n \ 
 i n f . y   =   3 0 0   \ n '   +   P a s h u a . w r i t e C o n f i g ( {   / /   A   s i n g l e   J S   o b j e c t ,   s o   t h e   { }   n e e d   n o t   
 	 	 	 	 	 	 	 	 	       / /   b e   e n c l o s e d   i n   [   a r r a y   b r a c k e t s   ] 
         " C o m m e n t s " :   " I n t r o d u c t o r y   t e x t " , 
         " n a m e " :   " t x t " , 
         " t y p e " :   " t e x t " , 
         " d e f a u l t " :   " D i a l o g   g e n e r a t e d   f r o m   a   m i x t u r e   o f   P a s h u a   C o n f i g   t e x t ,   \ n \ n '   +   n e w   D a t e ( )   +   ' a n d   J a v a S c r i p t   f o r   A u t o m a t i o n   o b j e c t s " , 
         " h e i g h t " :   2 7 6 , 
         " w i d t h " :   3 1 0 , 
         " x " :   3 4 0 , 
         " y " :   4 4 , 
         " t o o l t i p " :   " T h i s   i s   a n   e l e m e n t   o f   t y p e    t e x t  " 
     } )   +   ' \ n \ 
 #   I n t r o d u c t o r y   t e x t   \ n \ 
 t x t . t y p e   =   t e x t   \ n \ 
 t x t . d e f a u l t   =   P a s h u a   i s   a n   a p p l i c a t i o n   f o r   g e n e r a t i n g   d i a l o g   w i n d o w s   f r o m   p r o g r a m m i n g   l a n g u a g e s   w h i c h   l a c k   s u p p o r t   f o r   c r e a t i n g   n a t i v e   G U I s   o n   M a c   O S   X .   A n y   i n f o r m a t i o n   y o u   e n t e r   i n   t h i s   e x a m p l e   w i n d o w   w i l l   b e   r e t u r n e d   t o   t h e   c a l l i n g   s c r i p t   w h e n   y o u   h i t    O K  ;   i f   y o u   d e c i d e   t o   c l i c k    C a n c e l    o r   p r e s s    E s c    i n s t e a d ,   n o   v a l u e s   w i l l   b e   r e t u r n e d . [ r e t u r n ] [ r e t u r n ] T h i s   w i n d o w   s h o w s   n i n e   o f   t h e   U I   e l e m e n t   t y p e s   t h a t   a r e   a v a i l a b l e .   Y o u   c a n   f i n d   a   f u l l   l i s t   o f   a l l   G U I   e l e m e n t s   a n d   t h e i r   c o r r e s p o n d i n g   a t t r i b u t e s   i n   t h e   d o c u m e n t a t i o n   ('�   H e l p   m e n u )   t h a t   i s   i n c l u d e d   w i t h   P a s h u a .   \ n \ 
 t x t . h e i g h t   =   2 7 6   \ n \ 
 t x t . w i d t h   =   3 1 0   \ n \ 
 t x t . x   =   3 4 0   \ n \ 
 t x t . y   =   4 4   \ n \ 
 t x t . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    t e x t    \ n \ 
   \ n \ 
 #   A d d   a   t e x t   f i e l d   \ n \ 
 t f . t y p e   =   t e x t f i e l d   \ n \ 
 t f . l a b e l   =   E x a m p l e   t e x t f i e l d   \ n \ 
 t f . d e f a u l t   =   T e x t f i e l d   c o n t e n t   \ n \ 
 t f . w i d t h   =   3 1 0   \ n \ 
 t f . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    t e x t f i e l d    \ n \ 
   \ n \ 
 #   A d d   a   f i l e s y s t e m   b r o w s e r   \ n \ 
 o b . t y p e   =   o p e n b r o w s e r   \ n \ 
 o b . l a b e l   =   E x a m p l e   f i l e s y s t e m   b r o w s e r   ( t e x t f i e l d   +   o p e n   p a n e l )   \ n \ 
 o b . w i d t h = 3 1 0   \ n \ 
 o b . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    o p e n b r o w s e r    \ n \ 
   \ n '   +   P a s h u a . w r i t e C o n f i g ( [ {     / /   N o t e   t h a t   t h e   t w o   J S   o b j e c t s   a r e   g r o u p e d   b y   [   a r r a y   b r a c k e t s   ] 
         " C o m m e n t s " :   " D e f i n e   r a d i o b u t t o n s " , 
         " n a m e " :   " r b " , 
         " t y p e " :   " r a d i o b u t t o n " , 
         " l a b e l " :   " R a d i o   b u t t o n s   f r o m   J a v a S c r i p t   a r r a y " , 
         " o p t i o n s " :   l i s t A , 
         " t o o l t i p " :   " T h i s   i s   a n   e l e m e n t   o f   t y p e    r a d i o b u t t o n  " 
     } , 
     { 
         " C o m m e n t s " :   " A d d   a   p o p u p   m e n u " , 
         " n a m e " :   " p o p " , 
         " t y p e " :   " p o p u p " , 
         " l a b e l " :   " P o p u p   m e n u   f r o m   J a v a S c r i p t   a r r a y " , 
         " w i d t h " :   3 1 0 , 
         " o p t i o n s " :   l i s t B , 
         " d e f a u l t " :   l i s t B [ 0 ] , 
         " t o o l t i p " :   " T h i s   i s   a n   e l e m e n t   o f   t y p e    p o p u p  " 
     } ] )   +   ' \ n \ 
 #   A d d   2   c h e c k b o x e s   \ n \ 
 c h k . r e l y   =   - 1 8   \ n \ 
 c h k . t y p e   =   c h e c k b o x   \ n \ 
 c h k . l a b e l   =   P a s h u a   o f f e r s   c h e c k b o x e s ,   t o o   \ n \ 
 c h k . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    c h e c k b o x    \ n \ 
 c h k . d e f a u l t   =   1   \ n \ 
 c h k 2 . t y p e   =   c h e c k b o x   \ n \ 
 c h k 2 . l a b e l   =   B u t   t h i s   o n e   i s   d i s a b l e d   \ n \ 
 c h k 2 . d i s a b l e d   =   1   \ n \ 
 c h k 2 . t o o l t i p   =   A n o t h e r   e l e m e n t   o f   t y p e    c h e c k b o x    \ n \ 
   \ n \ 
 #   A d d   a   c a n c e l   b u t t o n   w i t h   d e f a u l t   l a b e l   \ n \ 
 c b . t y p e   =   c a n c e l b u t t o n   \ n \ 
 c b . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    c a n c e l b u t t o n    \ n \ 
   \ n \ 
 d b . t y p e   =   d e f a u l t b u t t o n   \ n \ 
 d b . t o o l t i p   =   T h i s   i s   a n   e l e m e n t   o f   t y p e    d e f a u l t b u t t o n    ( w h i c h   i s   a u t o m a t i c a l l y   a d d e d   t o   e a c h   w i n d o w ,   i f   n o t   i n c l u d e d   i n   t h e   c o n f i g u r a t i o n )   \ n \ 
 ' 
 
 v a r   a   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) , 
         s a   =   ( a . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ,   a ) ; 
 
 
 
 s a . a c t i v a t e ( ) ; 
 s a . d i s p l a y D i a l o g ( 
         ' J a v a S c r i p t   f o r   A u t o m a t i o n   r e c e i v e d   t h e   f o l l o w i n g   k e y : v a l u e \ n '   + 
         ' r e s u l t s   f r o m   a   P a s h u a . a p p   d i a l o g : \ n \ n '   + 
         J S O N . s t r i n g i f y ( 
 	 	 / /   s h o w D i a l o g   t a k e s   e i t h e r   a   s t r i n g   o r   a n   o b j e c t   a s   a n   a r g u m e n t 
                 P a s h u a . s h o w D i a l o g ( s t r C o n f i g ) , 
                 n u l l ,   2 
         ) ,   { 
                 b u t t o n s :   [ ' O K ' ] , 
                 d e f a u l t B u t t o n :   ' O K ' , 
                 c a n c e l B u t t o n :   ' O K ' , 
                 w i t h T i t l e :   ' P a s h u a   b i n d i n g   f o r   J a v a S c r i p t   f o r   A u t o m a t i o n ' 
         } 
 ) ; 
                              'ljscr  ��ޭ
#include <behaviors.dtsi>
#include <dt-bindings/zmk/keys.h>
#include <dt-bindings/zmk/bt.h>
#include <dt-bindings/zmk/outputs.h>

#define bas_l 0
#define nav_l 1
#define nas_l 2



 
 // this is the root part, everything comes from this.
 / {
     chosen {
        zmk,matrix_transform = &ortho_transform;
     };
 

     macros {
        // (TH, CH, SH, WH, GH, PH) are realized with combos (TN, CT, SN, WM, GM, FD
            TH_Macro: TH_Macro { //how does this work with 'The,' in the sense... capitalization?
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp T &kp H>
                    ;
            };
            Capital_T_TH_Macro: Captial_T_TH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(T) &kp H>
                    ;
            };
            CH_Macro: CH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp C &kp H>
                    ;
            };
            Capital_C_CH_Macro: Capital_C_CH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(C) &kp H>
                    ;
            };
            SH_Macro: SH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp S &kp H>
                    ;
            };
            Capital_S_SH_Macro: Capital_S_SH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(S) &kp H>
                    ;
            };
            WH_Macro: WH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp W &kp H>
                    ;
            };
            Capital_W_WH_Macro: Capital_W_WH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(W) &kp H>
                    ;
            };
            GH_Macro: GH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp G &kp H>
                    ;
            };
            Capital_G_GH_Macro: Capital_G_GH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(G) &kp H>
                    ;
            };
            PH_Macro: PH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp P &kp H>
                    ;
            };
            Capital_P_PH_Macro: Capital_P_PH_Macro { 
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(P) &kp H>
                    ;
            };
            Qu_Macro: Qu_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp Q &kp U>
                    ;
            };
            Capital_Q_Qu_Macro: Capital_Q_Qu_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LS(Q) &kp U>
                    ;
            };
                // I DON'T EVEN NEED MACROS FOR THESE LOL, just make them normal KPs
            Copy_Macro: Copy_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LG(C)>
                    ;
            };
             Paste_Macro: Paste_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                = <&kp LG(V)>
                ;
            };
            Undo_Macro: Undo_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                = <&kp LG(Z)>
                ;
            };
            Cut_Macro: Cut_Macro {
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp LG(X)>
                    ;
            };
            up3x: up3x { // to add?
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp UP &kp UP &kp UP>
                    ;
            };
            down3x: down3x { // to add?
                compatible = "zmk,behavior-macro";
                #binding-cells = <0>;
                bindings
                    = <&kp DOWN &kp DOWN &kp DOWN>
                    ;
            };
        };

     combos {
        compatible = "zmk,combos";

        combo_Z {
            timeout-ms = <50>;
            key-positions = <0 1>; // G+J
            bindings = <&kp Z>; 
            layers = <0>; //limited to only base layer
            };
        combo_Qu {
            timeout-ms = <50>;
            key-positions = <3 1>; //G+X
            bindings = <&qu_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };

        // H DIGRAPHS
        combo_TH {
            timeout-ms = <50>;
            key-positions = <14 15>; //N+T
            bindings = <&th_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };   
        combo_CH {
            timeout-ms = <50>;
            key-positions = <12 15>; //C+T
            bindings = <&ch_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };
        combo_SH {
            timeout-ms = <50>;
            key-positions = <13 14>; //S+N
            bindings = <&sh_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };
        combo_WH {
            timeout-ms = <50>;
            key-positions = <1 2>; //W+M
            bindings = <&wh_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };
        combo_GH {
            timeout-ms = <50>;
            key-positions = <2 3>; //G+M
            bindings = <&gh_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };
        combo_PH {
            timeout-ms = <50>;
            key-positions = <25 27>; //F+D
            bindings = <&ph_mod_morph>;  //output my macro
            layers = <0>; //limited to only base layer
            };
        combo_curly {
            timeout-ms = <25>; //needs to be short!
            key-positions = <21 22>; //E + I
            bindings = <&curly_mod_morph>;  
            layers = <0>; //limited to only base layer
            };
        combo_bracket {
            timeout-ms = <25>; //needs to be short!
            key-positions = <20 22>; //A + I
            bindings = <&bracket_mod_morph>;  
            layers = <0>; //limited to only base layer
            };
        combo_parenthesis {
            timeout-ms = <25>; //needs to be short!
            key-positions = <20 21>; //A + E
            bindings = <&parenthesis_mod_morph>;  
            layers = <0>; //limited to only base layer
            };
        };

        behaviors {

            jump_left_and_left: jump_left_and_left {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&jump_left_and_cmd_left>, <&kp LEFT>;
                mods = <(MOD_RALT)>;
            };
            jump_left_and_cmd_left: jump_left_and_cmd_left {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp LA(LEFT)>, <&kp LG(LEFT)>;
                mods = <(MOD_LGUI | MOD_RGUI)>;
            };
            jump_right_and_right: jump_right_and_right {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&jump_right_and_cmd_right>, <&kp RIGHT>;
                mods = <(MOD_RALT)>;
            };
            jump_right_and_cmd_right: jump_right_and_cmd_right {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp LA(RIGHT)>, <&kp LG(RIGHT)>;
                mods = <(MOD_LGUI | MOD_RGUI)>;
            };


            

            rh_HRMs: rh_HRMs {
                compatible = "zmk,behavior-hold-tap";
                flavor = "balanced"; // like qmk PERMISSIVE_HOLD
                tapping-term-ms = <280>; // triggers HOLD when time expires, or another key is pressed and released
                quick-tap-ms = <175>;                // repeat on tap-into-hold
                require-prior-idle-ms = <150>; // this removes the delay when typing quickly
                #binding-cells = <2>;
                bindings = <&kp>, <&kp>; //THIS IS FOR THE TWO KPS
                hold-trigger-key-positions = <0 1 2 3 4 5 12 13 14 15 16 17 24 25 26 27 28 29 36 37 38 39 40 41 42 43>; // all left hand and thumbs. LIKE ACHORDIAN. EVERYTHING EXCEPT WHAT I WANT
                hold-trigger-on-release;       // delay positional check until key-release
            };
            lh_HRMs: lh_HRMs {
                compatible = "zmk,behavior-hold-tap";
                flavor = "balanced";
                tapping-term-ms = <280>;
                quick-tap-ms = <175>;                // repeat on tap-into-hold
                require-prior-idle-ms = <150>;
                #binding-cells = <2>;
                bindings = <&kp>, <&kp>;
                hold-trigger-key-positions = <6 7 8 9 10 11 18 19 20 21 22 23 30 31 32 33 34 35 36 37 38 39 40 41 42 43>; // all right hand and thumb
                hold-trigger-on-release;             // delay positional check until key-release
            };
            //going to try to make thumb layer!
            left_thumb_HRM:left_thumb_HRM {
                compatible = "zmk,behavior-hold-tap";
                flavor = "balanced";
                tapping-term-ms = <280>;
                quick-tap-ms = <175>;                // repeat on tap-into-hold
                require-prior-idle-ms = <150>;
                #binding-cells = <2>;
                bindings = <&mo>, <&kp>;
                hold-trigger-key-positions = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 40 41 42 43>; // All hands, right thumb
                hold-trigger-on-release;     
            };
            right_thumb_HRM: right_thumb_HRM {
                compatible = "zmk,behavior-hold-tap";
                flavor = "balanced";
                tapping-term-ms = <280>;
                quick-tap-ms = <175>;                // repeat on tap-into-hold
                require-prior-idle-ms = <150>;
                #binding-cells = <2>;
                bindings = <&mo>, <&kp>;
                hold-trigger-key-positions = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39>; // All hands,  left thumb
                hold-trigger-on-release;  
            };
            comma_semi: comma_semi {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp COMMA>, <&kp SEMICOLON>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            star_hash: star_hash {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp ASTERISK>, <&kp HASH>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            period_colon: period_colon {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp PERIOD>, <&kp COLON>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            f_slash_b_slash: f-slash_b-slash {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp SLASH>, <&kp BACKSLASH>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            double_quotes_question: double_quotes_question {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp DOUBLE_QUOTES>, <&kp QUESTION>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            quote_exclaim: quote_exclaim {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp SQT>, <&kp EXCLAMATION>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            tilde_carrot: tilde_carrot {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp TILDE>, <&kp CARET>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            th_mod_morph: th_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&TH_Macro>, <&Capital_T_TH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            ch_mod_morph: ch_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&CH_Macro>, <&Capital_C_CH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            sh_mod_morph: sh_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&SH_Macro>, <&Capital_S_SH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            ph_mod_morph: ph_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&PH_Macro>, <&Capital_P_PH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            wh_mod_morph: wh_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&WH_Macro>, <&Capital_W_WH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            gh_mod_morph: gh_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&GH_Macro>, <&Capital_G_GH_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            qu_mod_morph: qu_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&Qu_Macro>, <&Capital_Q_Qu_Macro>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            curly_mod_morph: curly_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp LEFT_BRACE>, <&kp RIGHT_BRACE>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            bracket_mod_morph: bracket_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp LEFT_BRACKET>, <&kp RIGHT_BRACKET>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
            parenthesis_mod_morph: parenthesis_mod_morph {
                compatible = "zmk,behavior-mod-morph";
                #binding-cells = <0>;
                bindings = <&kp LEFT_PARENTHESIS>, <&kp RIGHT_PARENTHESIS>;
                mods = <(MOD_LSFT|MOD_RSFT)>;
            };
        };

    keymap {
        compatible = "zmk,keymap";

        bas_l {
            label = "Base";
            bindings = <
  //pos0 1      2          3         4      5                            6                 7          8           9          10                 11     
  &kp W  &kp X  &kp M      &kp G     &kp J  &kp LEFT_BRACKET            &kp RIGHT_BRACKET  &star_hash   &period_colon  &f_slash_b_slash  &double_quotes_question  &quote_exclaim
  //12      13          14                      15                              16                17     18                             19                  20                              21                                  22                              23      
  &lh_HRMs LEFT_CONTROL C  &lh_HRMs LEFT_ALT S  &lh_HRMs LEFT_COMMAND N      &lh_HRMs LSHIFT T     &kp K  &kp HASH        &kp HASH           &comma_semi  &rh_HRMs RSHIFT A       &rh_HRMs RIGHT_COMMAND E      &rh_HRMs RIGHT_ALT I              &rh_HRMs RIGHT_CONTROL H
  // 24  25     26         27        28     29                          30                  31         32         33         34                 35
  &kp P  &kp F  &kp L      &kp D     &kp V  &kp HASH                    &kp HASH           &kp MINUS  &kp U       &kp O      &kp Y              &kp B
                        //36       37        38     39                40        41                 42         43
                        &kp ESCAPE  &kp BACKSPACE &left_thumb_HRM 2 R  &kp HASH  &kp HASH  &right_thumb_HRM 1 SPACE    &kp RET   &kp TAB
             >;                                                                                    //make sure nav layer is on thumb!
         };
        nav_l {
            label = "Nav";
            bindings = <
&none   &none  &kp LG(A)       &none      &none  &none          &none  &none  &Paste_Macro        &Copy_Macro          &Cut_Macro        &Undo_Macro
&jump_left_and_left  &kp UP  &kp DOWN       &jump_right_and_right      &none  &none          &none  &none  &kp LEFT_SHIFT  &kp RIGHT_ALT  &kp RIGHT_COMMAND  &kp RIGHT_CONTROL 
&none  &up3x     &down3x  &kp LG(G)        &none  &none          &none  &none  &none        &kp LC(LALT)         &none          &none
                        &kp ESCAPE     &kp BACKSPACE  &none   &none  &none  &none  &kp RET    &kp TAB
            >;
        };

                nas_l {
            label = "Nas";
            bindings = <
&kp PERCENT    &kp AT_SIGN  &kp DOLLAR  &tilde_carrot       &none  &bt BT_CLR           &bt BT_SEL 2  &star_hash   &kp N7        &kp N8        &kp NUMBER_9  &none
&lh_HRMs LEFT_COMMAND LESS_THAN  &lh_HRMs LEFT_ALT MINUS   &lh_HRMs LEFT_CONTROL PIPE    &lh_HRMs LSHIFT GREATER_THAN  &none  &bt BT_SEL 0         &bt BT_SEL 3  &comma_semi  &rh_HRMs RSHIFT NUMBER_1  &rh_HRMs RIGHT_CONTROL NUMBER_2  &rh_HRMs RIGHT_ALT N5 &rh_HRMs RIGHT_COMMAND N0
&kp AMPERSAND  &kp PLUS     &kp EQUAL   &kp GRAVE         &none  &bt BT_SEL 1         &bt BT_SEL 4  &kp MINUS      &kp NUMBER_3  &kp NUMBER_4  &kp NUMBER_6  &none
                            &none      &none            &none  &none         &none  &kp PERIOD    &kp COMMA      &none
            >;
        };
    };
};
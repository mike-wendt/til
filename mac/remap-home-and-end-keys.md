# Remap the Home and End Keys

### For Non-Terminal Apps

Create the directory/file if not already there: 
`~/Library/KeyBindings/DefaultKeyBinding.dict`

```
{
/* Remap Home / End to be correct :-) */
"\UF729"  = "moveToBeginningOfLine:";                   /* Home         */
"\UF72B"  = "moveToEndOfLine:";                         /* End          */
"$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
"$\UF72B" = "moveToEndOfLineAndModifySelection:";       /* Shift + End  */
}
```

### For Terminal

Set the following in the keyboard preferences for the Terminal:

```
    home :: \033OH
    end :: \033OF
    F1 :: \033[11~
    F2 :: \033[12~
    F3 :: \033[13~
    F4 :: \033[14~
```


### Sources
* https://lifehacker.com/225873/mac-switchers-tip--remap-the-home-and-end-keys
* https://jeffmikels.org/posts/how-to-fix-home-and-end-keys-in-the-mac-terminal/

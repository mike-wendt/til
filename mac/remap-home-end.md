# Remap the Home and End Keys

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

### Source 
https://lifehacker.com/225873/mac-switchers-tip--remap-the-home-and-end-keys

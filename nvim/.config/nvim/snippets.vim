iabbrev param_test tt := []struct{<CR>
    \tName string<CR>
  \}{}<CR>
  \for _, tc := range tt {<CR>
    \t.Run(tc.tName, func(t*testing.T){<CR>
      \assert, require := assert.New(t), require.New(t)<CR>
      \<CR>
    \})<CR>
  \}

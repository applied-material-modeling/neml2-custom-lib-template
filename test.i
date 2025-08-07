[Settings]
  additional_libraries = 'build/libmylib.so'
  # on mac this is probably 'build/libmylib.dylib'
[]

[Models]
  [a_model_from_neml2]
    type = ScalarLinearCombination
    from_var = 'state/A state/B'
    coefficients = '-1.1 2.3'
    to_var = 'state/C'
  []
  [another_model_from_neml2]
    type = ScalarLinearCombination
    from_var = 'state/B state/C'
    coefficients = '0.3 -1'
    to_var = 'state/D'
  []
  ######################################### our custom model
  [my_custom_model]
    type = MyModel
    y = 'state/E'
    x1 = 'state/C'
    x2 = 'state/D'
  []
  #########################################
  [model]
    type = ComposedModel
    models = 'a_model_from_neml2 another_model_from_neml2 my_custom_model'
  []
[]

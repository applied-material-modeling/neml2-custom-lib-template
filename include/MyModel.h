#include "neml2/models/Model.h"

namespace neml2
{
/// y = x1 + x2
class MyModel : public Model
{
public:
  static OptionSet expected_options();
  MyModel(const OptionSet &);

protected:
  void set_value(bool, bool, bool) override;

  Variable<Scalar> & _y;
  const Variable<Scalar> & _x1;
  const Variable<Scalar> & _x2;
};
} // namespace neml2

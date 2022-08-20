
class AService
  def create_a_thing(thing_attributes:)
  end
end

describe AService do
  describe_method :create_a_thing do
    outcome.returns(AThing) do
      it 'should test any conditions that can result in this (probably happy path)'
    end

    outcome.returns(AThing) do # would this be with different attributes? should that be part of the `returns` signature?
      # can we list what's unique about these instances?
      # like outcomes.returns(Person, slices: %i(age))
      it 'should test these alternate conditions'
    end

    outcome.returns(false) do
      it 'should not make a case like this because it is returning different types'
      it 'should still be allowed and feasible since ruby CAN do this so some apps probably do and we do not want to restrict adoption'
    end

    outcome.raises(ResourceConfigurationError) do
      it 'should test any conditions that can result in this error'
    end
  end
end

# => Outcomes report multiple return types which is a code smell.
#      Disable this with Mocker.config.warn_on_multiple_return_types = false

describe AController do
  depends_on AService
end

# => Missing test cases for outcome: raises ResourceConfigurationError
# => Missing test cases for outcome: returns AThing
# => Missing test cases for outcome: returns false

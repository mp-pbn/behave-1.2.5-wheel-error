from ns.bar.demo import hello

@when(u'I have a step importing production code')
def step_impl(context):
    hello()

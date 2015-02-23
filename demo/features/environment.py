def before_all(context):
    """Behave method executed before everything"""
    context.before_all_run = True

def after_scenario(context, scenario):
    """Behave method executed after each scenario"""
    context.after_scenario_run = True


<%!
    import shutil
    from logging import getLogger

    import onlinejudge_template.generator.julia as julia
    import onlinejudge_template.generator.about as about
    # import onlinejudge_template.generator.hook as hook
%>\
<%
    logger = getLogger(__name__)
    if not shutil.which("yapf"):
        logger.warning("yapf is not installed. If you want to generate well-formatted code, please install it. You can use $ pip3 install yapf")
    else:
        format_config = "{" + ", ".join([
            "BASED_ON_STYLE: google",
            "COLUMN_LIMIT: 9999",
        ]) + "}"
        # hook.register_filter_command(["yapf", "--style", format_config], data=data)
%>\
#!/usr/bin/env julia

${julia.declare_constants(data)}

# def solve(${julia.formal_arguments(data)}) -> ${julia.return_type(data)}:
function solve(${julia.formal_arguments(data, typed=False)})
    pass  # TODO: edit here

end

# generated by ${about.title} ${about.version} (${about.url})
function main()
${julia.read_input(data)}
    ${julia.return_value(data)} = solve(${julia.actual_arguments(data)})
${julia.write_output(data)}

end

main()

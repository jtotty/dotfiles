<?php

return (new PhpCsFixer\Config())
    ->setRules([
        '@PSR2'                   => true,
        '@PSR12'                  => true,
        '@Symfony'                => true,
        'array_syntax'            => ['syntax' => 'short'],
        'array_indentation'       => true,
        'no_unused_imports'       => true,
        'align_multiline_comment' => [
            'comment_type' => 'phpdocs_like',
        ],
        'binary_operator_spaces' => [
            'operators' => [
                '=>' => 'align_single_space_minimal',
                '='  => 'align_single_space_minimal',
            ],
        ],
        'concat_space'               => ['spacing' => 'one'],
        'combine_consecutive_issets' => true,
        'combine_consecutive_unsets' => true,
        'class_definition'           => [
            'multi_line_extends_each_single_line' => true,
        ],
        'function_typehint_space'          => true,
        'general_phpdoc_annotation_remove' => [
            'annotations' => [
                'author',
            ],
        ],
        'group_import'                          => true,
        'single_import_per_statement'           => false,
        'single_line_comment_style'             => ['comment_types' => ['asterisk', 'hash']],
        'ordered_imports'                       => ['sort_algorithm' => 'alpha'],
        'linebreak_after_opening_tag'           => true,
        'constant_case'                         => ['case' => 'lower'],
        'lowercase_static_reference'            => true,
        'no_blank_lines_after_phpdoc'           => true,
        'no_blank_lines_after_class_opening'    => true,
        'no_closing_tag'                        => true,
        'no_empty_comment'                      => true,
        'no_empty_phpdoc'                       => true,
        'no_empty_statement'                    => true,
        'no_leading_namespace_whitespace'       => true,
        'no_mixed_echo_print'                   => ['use' => 'echo'],
        'no_superfluous_phpdoc_tags'            => true,
        'no_trailing_comma_in_singleline_array' => true,
        'no_useless_else'                       => true,
        'no_whitespace_before_comma_in_array'   => true,
        'no_whitespace_in_blank_line'           => true,
        'ordered_class_elements'                => [
            'order' => [
                'use_trait',
                'constant_public', 'constant_protected', 'constant_private',
                'property_public', 'property_protected', 'property_private',
                'construct', 'destruct', 'magic', 'phpunit', 'method_public',
                'method_protected', 'method_private',
            ],
        ],
        'phpdoc_add_missing_param_annotation' => true,
        'phpdoc_align'                        => true,
        'single_blank_line_at_eof'            => true,
        'space_after_semicolon'               => true,
        'switch_case_semicolon_to_colon'      => true,
        'trailing_comma_in_multiline'         => true,
        'trim_array_spaces'                   => true,
        'whitespace_after_comma_in_array'     => true,
        'yoda_style'                          => false,
        'php_unit_method_casing'              => ['case' => 'snake_case'],
    ])
    ->setLineEnding("\n");

interface zif_language_dependent_text public.

  types t_language_key type spras.

  types t_language_keys type sorted table of zif_language_dependent_text=>t_language_key with unique key table_line.

  types: begin of t_translation,
           language_key type zif_language_dependent_text=>t_language_key,
           content type string,
         end of t_translation,
         t_translations type sorted table of zif_language_dependent_text=>t_translation with unique key language_key.

  methods in
            importing
              i_language_key type zif_language_dependent_text=>t_language_key
            returning
              value(r_text_in_supplied_language) type string
            raising
              cx_sy_itab_line_not_found.

  methods in_current_language
            returning
              value(r_text_in_current_language) type string
            raising
              cx_sy_itab_line_not_found.

  methods available_languages
            returning
              value(r_languages) type zif_language_dependent_text=>t_language_keys.

  methods available_translations
            returning
              value(r_translations) type zif_language_dependent_text=>t_translations.

endinterface.

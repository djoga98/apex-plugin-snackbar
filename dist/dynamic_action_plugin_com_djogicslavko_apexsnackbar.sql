prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2100361412142254
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
end;
/
 
prompt APPLICATION 102 - DS Plugins
--
-- Application Export:
--   Application:     102
--   Name:            DS Plugins
--   Date and Time:   16:22 Saturday December 5, 2020
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 3200260473281229
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     300177295433990
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_djogicslavko_apexsnackbar
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(3200260473281229)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.DJOGICSLAVKO.APEXSNACKBAR'
,p_display_name=>'Material Design Snackbar'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_snackbar (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result',
'is',
'    l_body                  varchar2(4000) := p_dynamic_action.attribute_01;',
'    l_hide_after_sec_number number         := p_dynamic_action.attribute_02;',
'    l_action_text           varchar2(4000) := p_dynamic_action.attribute_03;',
'    l_action                varchar2(4000) := p_dynamic_action.attribute_04;',
'    l_snackbar_bg_color     varchar2(10)   := p_dynamic_action.attribute_05;',
'    l_snackbar_txt_color    varchar2(10)   := p_dynamic_action.attribute_06;',
'    l_action_txt_color      varchar2(10)   := p_dynamic_action.attribute_07;',
'    l_snackbar_position     varchar2(20)   := p_dynamic_action.attribute_08;',
'',
'    l_params                varchar2(4000);',
'',
'    l_result                apex_plugin.t_dynamic_action_render_result;',
'begin',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_dynamic_action (',
'            p_plugin         => p_plugin,',
'            p_dynamic_action => p_dynamic_action',
'        );',
'    end if;',
'',
'    apex_css.add_file (',
'        p_name      => ''apex_snackbar.min'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null',
'    );',
'',
'    apex_javascript.add_library (',
'        p_name      => ''apex_snackbar.min'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null',
'    );',
'',
'    if l_action is not null then',
'        l_params := ''{ message: "'' || l_body || ''", time: '' || l_hide_after_sec_number || '', backgroundColor: "'' || l_snackbar_bg_color || ''", textColor: "'' || l_snackbar_txt_color || ''", actionText: "'' || l_action_text || ''", actionColor: "'' || l_ac'
||'tion_txt_color || ''", position: "'' || l_snackbar_position || ''", action: '' || l_action || '' }'';',
'    else',
'        l_params := ''{ message: "'' || l_body || ''", time: '' || l_hide_after_sec_number || '', backgroundColor: "'' || l_snackbar_bg_color || ''", textColor: "'' || l_snackbar_txt_color || ''", actionText: "'' || l_action_text || ''", actionColor: "'' || l_ac'
||'tion_txt_color || ''", position: "'' || l_snackbar_position || ''" }'';',
'    end if;',
'',
'    l_result.javascript_function := ''function() { createSnackbar('' || l_params || '') }'';',
'',
'    return l_result;',
'end;'))
,p_api_version=>2
,p_render_function=>'render_snackbar'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/djoga98/apex-plugin-snackbar'
,p_files_version=>18
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(3300276074291350)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Notification text'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(3500209879300928)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Hide after n seconds'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'3000'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(3700258397445275)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Action text'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(3700557314451704)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Action'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(3700258397445275)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(4200260381642345)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Snackbar background color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#323232'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(4200961267643835)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Snackbar text color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#fff'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(4201601057648457)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Snackbar action text color'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_default_value=>'#ffeb3b'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(3700258397445275)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(4601485978894876)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Snackbar position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'snackbar-center'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(4602166889896940)
,p_plugin_attribute_id=>wwv_flow_api.id(4601485978894876)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'snackbar-left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(4602527125897881)
,p_plugin_attribute_id=>wwv_flow_api.id(4601485978894876)
,p_display_sequence=>20
,p_display_value=>'Center'
,p_return_value=>'snackbar-center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(4602931340898762)
,p_plugin_attribute_id=>wwv_flow_api.id(4601485978894876)
,p_display_sequence=>30
,p_display_value=>'Right'
,p_return_value=>'snackbar-right'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220637265617465536E61636B6261723D66756E6374696F6E28297B76617220743D6E756C6C3B72657475726E2066756E6374696F6E2865297B742626742E6469736D69737328293B76617220693D646F63756D656E742E637265617465456C656D';
wwv_flow_api.g_varchar2_table(2) := '656E74282264697622293B692E7374796C652E6261636B67726F756E64436F6C6F723D652E6261636B67726F756E64436F6C6F722C692E7374796C652E636F6C6F723D652E74657874436F6C6F722C692E636C6173734E616D653D22617065782D736E61';
wwv_flow_api.g_varchar2_table(3) := '636B62617220222B652E706F736974696F6E2C692E6469736D6973733D66756E6374696F6E28297B746869732E7374796C652E6F7061636974793D307D3B766172206E3D646F63756D656E742E637265617465546578744E6F646528652E6D6573736167';
wwv_flow_api.g_varchar2_table(4) := '65293B696628692E617070656E644368696C64286E292C652E616374696F6E54657874297B652E616374696F6E7C7C28652E616374696F6E3D692E6469736D6973732E62696E64286929293B766172206F3D646F63756D656E742E637265617465456C65';
wwv_flow_api.g_varchar2_table(5) := '6D656E742822627574746F6E22293B6F2E7374796C652E636F6C6F723D652E616374696F6E436F6C6F722C6F2E636C6173734E616D653D22616374696F6E222C6F2E696E6E657248544D4C3D652E616374696F6E546578742C6F2E6164644576656E744C';
wwv_flow_api.g_varchar2_table(6) := '697374656E65722822636C69636B222C652E616374696F6E292C692E617070656E644368696C64286F297D73657454696D656F75742866756E6374696F6E28297B743D3D3D746869732626742E6469736D69737328297D2E62696E642869292C652E7469';
wwv_flow_api.g_varchar2_table(7) := '6D65292C692E6164644576656E744C697374656E657228227472616E736974696F6E656E64222C66756E6374696F6E28652C69297B226F706163697479223D3D3D652E70726F70657274794E616D652626303D3D746869732E7374796C652E6F70616369';
wwv_flow_api.g_varchar2_table(8) := '7479262628746869732E706172656E74456C656D656E742E72656D6F76654368696C642874686973292C743D3D3D74686973262628743D6E756C6C29297D2E62696E64286929292C743D692C646F63756D656E742E626F64792E617070656E644368696C';
wwv_flow_api.g_varchar2_table(9) := '642869292C676574436F6D70757465645374796C652869292E626F74746F6D2C692E7374796C652E626F74746F6D3D22307078222C692E7374796C652E6F7061636974793D317D7D28293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(4703768156954643)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_file_name=>'apex_snackbar.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E617065782D736E61636B6261727B2D7765626B69742D7472616E736974696F6E2D70726F70657274793A6F7061636974792C626F74746F6D2C6C6566742C72696768742C77696474682C6D617267696E2C626F726465722D7261646975733B2D6F2D74';
wwv_flow_api.g_varchar2_table(2) := '72616E736974696F6E2D70726F70657274793A6F7061636974792C626F74746F6D2C6C6566742C72696768742C77696474682C6D617267696E2C626F726465722D7261646975733B7472616E736974696F6E2D70726F70657274793A6F7061636974792C';
wwv_flow_api.g_varchar2_table(3) := '626F74746F6D2C6C6566742C72696768742C77696474682C6D617267696E2C626F726465722D7261646975733B2D7765626B69742D7472616E736974696F6E2D6475726174696F6E3A2E35733B2D6F2D7472616E736974696F6E2D6475726174696F6E3A';
wwv_flow_api.g_varchar2_table(4) := '2E35733B7472616E736974696F6E2D6475726174696F6E3A2E35733B2D7765626B69742D7472616E736974696F6E2D74696D696E672D66756E6374696F6E3A656173653B2D6F2D7472616E736974696F6E2D74696D696E672D66756E6374696F6E3A6561';
wwv_flow_api.g_varchar2_table(5) := '73653B7472616E736974696F6E2D74696D696E672D66756E6374696F6E3A656173653B666F6E742D66616D696C793A696E68657269743B666F6E742D73697A653A313470783B6D696E2D6865696768743A313470783B706F736974696F6E3A6669786564';
wwv_flow_api.g_varchar2_table(6) := '3B646973706C61793A2D7765626B69742D626F783B646973706C61793A2D6D732D666C6578626F783B646973706C61793A666C65783B2D7765626B69742D626F782D7061636B3A6A7573746966793B2D6D732D666C65782D7061636B3A6A757374696679';
wwv_flow_api.g_varchar2_table(7) := '3B6A7573746966792D636F6E74656E743A73706163652D6265747765656E3B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E2D6974656D733A63656E7465723B6C696E';
wwv_flow_api.g_varchar2_table(8) := '652D6865696768743A323270783B70616464696E673A3138707820323470783B626F74746F6D3A303B6F7061636974793A307D406D6564696120286D696E2D77696474683A3634307078297B2E617065782D736E61636B6261727B6D696E2D7769647468';
wwv_flow_api.g_varchar2_table(9) := '3A32383870783B6D61782D77696474683A35363870783B646973706C61793A2D7765626B69742D696E6C696E652D626F783B646973706C61793A2D6D732D696E6C696E652D666C6578626F783B646973706C61793A696E6C696E652D666C65783B626F72';
wwv_flow_api.g_varchar2_table(10) := '6465722D7261646975733A3270783B6D617267696E3A323470783B626F74746F6D3A2D31303070787D7D406D6564696120286D61782D77696474683A3634307078297B2E617065782D736E61636B6261727B6C6566743A303B72696768743A307D7D2E61';
wwv_flow_api.g_varchar2_table(11) := '7065782D736E61636B626172202E616374696F6E7B6261636B67726F756E643A696E68657269743B646973706C61793A696E6C696E652D626C6F636B3B626F726465723A6E6F6E653B666F6E742D73697A653A696E68657269743B746578742D7472616E';
wwv_flow_api.g_varchar2_table(12) := '73666F726D3A7570706572636173653B6D617267696E3A302030203020323470783B70616464696E673A303B6D696E2D77696474683A2D7765626B69742D6D696E2D636F6E74656E743B6D696E2D77696474683A2D6D6F7A2D6D696E2D636F6E74656E74';
wwv_flow_api.g_varchar2_table(13) := '3B6D696E2D77696474683A6D696E2D636F6E74656E743B637572736F723A706F696E7465723B6F75746C696E653A307D2E736E61636B6261722D6C6566747B6C6566743A3021696D706F7274616E747D2E736E61636B6261722D63656E7465727B6C6566';
wwv_flow_api.g_varchar2_table(14) := '743A35302521696D706F7274616E743B7472616E73666F726D3A7472616E736C617465282D3530252921696D706F7274616E747D2E736E61636B6261722D72696768747B72696768743A3021696D706F7274616E747D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5001088510100409)
,p_plugin_id=>wwv_flow_api.id(3200260473281229)
,p_file_name=>'apex_snackbar.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

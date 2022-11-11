--odps sql 
--********************************************************************--
--author:Razzak, Khandaker
--create time:2022-11-06 02:23:17
--Created SQL table for the Chat Data.
--********************************************************************--

SELECT SUBSTR(chat_time, 1, 2) chat_hour,
          COUNT(DISTINCT D1) AS date_1,
          COUNT(DISTINCT D2) AS date_2,
          COUNT(DISTINCT D3) AS date_3,
          COUNT(DISTINCT D4) AS date_4,
          COUNT(DISTINCT D5) AS date_5,
          COUNT(DISTINCT D6) AS date_6,
          COUNT(DISTINCT D7) AS date_7,
          COUNT(DISTINCT D8) AS date_8

FROM(

    SELECT chat_time,

        CASE WHEN date_id = '2022-10-24' THEN session_id END D1,
        CASE WHEN date_id = '2022-10-25' THEN session_id END D2,
        CASE WHEN date_id = '2022-10-26' THEN session_id END D3,
        CASE WHEN date_id = '2022-10-27' THEN session_id END D4,
        CASE WHEN date_id = '2022-10-28' THEN session_id END D5,
        CASE WHEN date_id = '2022-10-29' THEN session_id END D6,
        CASE WHEN date_id = '2022-10-30' THEN session_id END D7,
        CASE WHEN date_id = '2022-10-31' THEN session_id END D8

    FROM(
        
        SELECT date_id,
        session_id,
        SUBSTR(local_gmt_create, 12, 19) AS chat_time,
        
        is_session_direct_agent,
        is_session_unsatisfied, 
        is_session_intention_to_agent,
        is_session_last_chat_no_answer,
        is_session_click_to_agent,
        is_session_switch_to_agent,
        is_session_last_chat_recommend_not_clk

        FROM daraz_chatbot_chat_and_session_details_table

        WHERE tenant_name_new = 'Alime-DRZ-CC-BD'

    )

    --** For all the sessions collected between two dates **--
    WHERE date_id >= '2022-10-24' AND date_id <= '2022-10-31'

    --//Time ------------------
    -- AND chat_time >= '09:00:00'
    -- AND chat_time <= '10:00:00'
    --//-----------------------

    -- Resolved Sessions
     AND is_session_unsatisfied = 'N'
     AND is_session_direct_agent = 'N'
     AND is_session_intention_to_agent = 'N'
     AND is_session_last_chat_no_answer = 'N'
     AND is_session_click_to_agent = 'N'
     AND is_session_switch_to_agent = 'N'
     AND is_session_last_chat_recommend_not_clk ='N'


    -- Direct Agent Sessions 
    -- AND is_session_direct_agent = "Y"

    --Switch to Live Agents
    -- AND is_session_switch_to_agent = 'Y'
    -- AND is_session_direct_agent = 'N'

    --Intention to Agent
    -- AND is_session_intention_to_agent = 'Y'
    -- AND is_session_direct_agent = 'N'

    --Total Sessions
    -- Comment out all the parameters

) GROUP BY chat_hour ORDER BY chat_hour
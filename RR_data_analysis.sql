SELECT SUBSTR(chat_time,1,2) AS "Chat Time", 
       COUNT(DISTINCT session_id) AS resolved_sessions 
       

FROM(
    SELECT  date_id,
            session_id,
            SUBSTR(local_gmt_create,12,19) AS chat_time,
            -- robot_time_zone,
            -- local_gmt_create, 
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
WHERE date_id >= '2022-01-01' AND date_id <= '2022-10-30'
-- AND chat_time >= '00' and chat_time < '01:00:00'
-- WhERE date_id = '2022-10-01'
        
        --//Time ------------------
        -- AND chat_time >= '09:00:00'
        -- AND chat_time <= '10:00:00'
        --//-----------------------

        -- Direct Agent Sessions 
        -- AND is_session_direct_agent = "Y"

        -- Resolved Sessions
        AND is_session_unsatisfied = 'N'
        AND is_session_direct_agent = 'N'
        AND is_session_intention_to_agent = 'N'
        AND is_session_last_chat_no_answer = 'N'
        AND is_session_click_to_agent = 'N'
        AND is_session_switch_to_agent = 'N'
        AND is_session_last_chat_recommend_not_clk ='N'

        --Switch to Live Agents

        -- AND is_session_switch_to_agent = 'Y'
        -- AND is_session_direct_agent = 'N'

        --Intention to Agent
        -- AND is_session_intention_to_agent = 'Y'
        -- AND is_session_direct_agent = 'N'


        --Total Sessions
        -- Comment out all the parameters

GROUP BY SUBSTR(chat_time,1,2) ORDER BY SUBSTR(chat_time,1,2);
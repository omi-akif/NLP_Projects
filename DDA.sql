SELECT chat_time,
            question,
            customer_side_conversation,
            agent_side_conversation

        -- CASE WHEN date_id = '2022-10-24' THEN session_id END D1,
        -- CASE WHEN date_id = '2022-10-25' THEN session_id END D2,
        -- CASE WHEN date_id = '2022-10-26' THEN session_id END D3,
        -- CASE WHEN date_id = '2022-10-27' THEN session_id END D4,
        -- CASE WHEN date_id = '2022-10-28' THEN session_id END D5,
        -- CASE WHEN date_id = '2022-10-29' THEN session_id END D6,
        -- CASE WHEN date_id = '2022-10-30' THEN session_id END D7,
        -- CASE WHEN date_id = '2022-10-31' THEN session_id END D8

    FROM(
        
        SELECT date_id,
        session_id,
        SUBSTR(local_gmt_create, 12, 19) AS chat_time,
        
        question,
        customer_side_conversation,
        agent_side_conversation,
        

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
    -- WHERE date_id >= '2022-10-24' AND date_id <= '2022-10-31'
    WHERE date_id = '2022-11-06'

    -- //Time ------------------
    AND chat_time >= '13:00:00'
    AND chat_time <= '17:00:00'
    -- //-----------------------
    -- Resolved Sessions
    --  AND is_session_unsatisfied = 'N'
    --  AND is_session_direct_agent = 'N'
    --  AND is_session_intention_to_agent = 'N'
    --  AND is_session_last_chat_no_answer = 'N'
    --  AND is_session_click_to_agent = 'N'
    --  AND is_session_switch_to_agent = 'N'
    --  AND is_session_last_chat_recommend_not_clk ='N'


    -- Direct Agent Sessions 
    -- AND is_session_direct_agent = "Y"

    --Switch to Live Agents
    -- AND is_session_switch_to_agent = 'Y'
    -- AND is_session_direct_agent = 'N'

    --Intention to Agent
    AND is_session_intention_to_agent = 'Y'
    AND is_session_direct_agent = 'N'

    ORDER BY chat_time













     SELECT 
            chat_time,
            question,
            last_query_before_live_agent_session
            customer_side_conversation,
            agent_side_conversation
            -- feedback_content
            

        -- CASE WHEN date_id = '2022-10-24' THEN session_id END D1,
        -- CASE WHEN date_id = '2022-10-25' THEN session_id END D2,
        -- CASE WHEN date_id = '2022-10-26' THEN session_id END D3,
        -- CASE WHEN date_id = '2022-10-27' THEN session_id END D4,
        -- CASE WHEN date_id = '2022-10-28' THEN session_id END D5,
        -- CASE WHEN date_id = '2022-10-29' THEN session_id END D6,
        -- CASE WHEN date_id = '2022-10-30' THEN session_id END D7,
        -- CASE WHEN date_id = '2022-10-31' THEN session_id END D8

    FROM(
        
        SELECT date_id,
        session_id,
        SUBSTR(local_gmt_create, 12, 19) AS chat_time,
        
        question,
        customer_side_conversation,
        agent_side_conversation,
        last_query_before_live_agent_session,
        feedback_content

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
    -- WHERE date_id >= '2022-10-24' AND date_id <= '2022-10-31'
    WHERE date_id = '2022-11-06'

    -- //Time ------------------
    AND chat_time >= '15:00:00'
    AND chat_time <= '17:00:00'
    -- //-----------------------
    -- Resolved Sessions
    --  AND is_session_unsatisfied = 'N'
    --  AND is_session_direct_agent = 'N'
    --  AND is_session_intention_to_agent = 'N'
    --  AND is_session_last_chat_no_answer = 'N'
    --  AND is_session_click_to_agent = 'N'
    --  AND is_session_switch_to_agent = 'N'
    --  AND is_session_last_chat_recommend_not_clk ='N'


    -- Direct Agent Sessions 
    -- AND is_session_direct_agent = "Y"

    --Switch to Live Agents
    -- AND is_session_switch_to_agent = 'Y'
    -- AND is_session_direct_agent = 'N'

    --Intention to Agent
    AND is_session_intention_to_agent = 'Y'
    AND is_session_direct_agent = 'N'

    ORDER BY chat_time
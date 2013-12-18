<?xml version="1.0" encoding="UTF-8" ?>

<ROOT>
   <FOLDER name="数据报表" type="folder" permission="1" id="sjbb">
   		<NODE name="综合数据" module="data/synthesis_list" permission="1"  visiable="true"></NODE>
   		<NODE name="注册创建" module="data/createData_list" permission="2"  visiable="true"></NODE>
   		<NODE name="登录在线图表" module="data/loginData_list" permission="4"  visiable="true"></NODE>
   		<NODE name="充值图表" module="data/rechargeData_list" permission="8"  visiable="true"></NODE>
   		<NODE name="单系统ARPU" module="data/singleArpuData_list" permission="16"  visiable="true"></NODE>
   		<NODE name="充值排名" module="data/rechargeOrderData_list" permission="32"  visiable="true"></NODE>
   		<NODE name="用户分析" module="data/userAnalysisData_list" permission="64"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="流失率"  type="folder" permission="2" id="lsl">
   			<NODE name="角色流失率" module="data/userTurnOverData_list" permission="1"  visiable="true"></NODE>
   			<NODE name="等级流失率" module="data/levelData_list" permission="2"  visiable="true"></NODE>
   			<NODE name="时间段流失率" module="data/turnoverData_list" permission="4"  visiable="true"></NODE>
   	</FOLDER>
   	<FOLDER name="留存活跃" module="" type="folder" permission="4" id="lchy">
			<NODE name="玩家留存率" module="data/userStayData_list" permission="1"  visiable="true"></NODE>
			<NODE name="每日任务" module="data/dailyTaskData_list" permission="2"  visiable="true"></NODE>
			<NODE name="全部副本" module="data/dailyCopyData_list" permission="4"  visiable="true"></NODE>
			<NODE name="各类活动" module="data/dailyActivityData_list" permission="8"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="游戏角色信息" type="folder" permission="8" id="yxjsxx">
   		<NODE name="玩家列表" module="games/player_list" permission="1"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="日志管理1" type="folder"permission="16" id="rzgl1">
   		<NODE name="充值日志" module="log/pay_list" permission="1"  visiable="true"></NODE>
   		<NODE name="元宝日志" module="log/yuanbao_list" permission="2"  visiable="true"></NODE>
   		<NODE name="银币日志" module="log/coin_list" permission="4"  visiable="true"></NODE>
   		<NODE name="精力日志" module="log/jingli_list" permission="8"  visiable="true"></NODE>
   		<NODE name="荣誉日志" module="log/horn_list" permission="16"  visiable="true"></NODE>
   		<NODE name="灵气日志" module="log/lingqi_list" permission="32"  visiable="true"></NODE>
   		<NODE name="帮贡日志" module="log/contributionDaily_list" permission="64"  visiable="true"></NODE>
   		<NODE name="伏魔日志" module="log/fumoDaily_list" permission="128"  visiable="true"></NODE>
   		<NODE name="军衔日志" module="log/rank_list" permission="256"  visiable="true"></NODE>
   		<NODE name="升星日志" module="log/star_list" permission="512"  visiable="true"></NODE>
   		<NODE name="魂武日志" module="log/soul_list" permission="1024"  visiable="true"></NODE>
   	 	<NODE name="培养日志" module="log/peiyang_list" permission="2048"  visiable="true"></NODE>
   		<NODE name="法宝日志" module="log/fabaoDaily_list" permission="4096"  visiable="true"></NODE>
   		<NODE name="经验日志" module="log/expDaily_list" permission="8192"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="日志管理2" type="folder"permission="32" id="rzgl2">
   	    <NODE name="装备强化日志" module="log/zbqh_list" permission="1"  visiable="true"></NODE>
   		<NODE name="装备洗练日志" module="log/zbxl_list" permission="2"  visiable="true"></NODE>
   		<NODE name="装备继承日志" module="log/zbjc_list" permission="4"  visiable="true"></NODE>
   		<NODE name="装备打造日志" module="log/zbdz_list" permission="8"  visiable="true"></NODE>
   		 <NODE name="符文合成日志" module="log/fuwenhc_list" permission="16"  visiable="true"></NODE>
   		<NODE name="伙伴卡合成日志" module="log/huobanka_list" permission="32"  visiable="true"></NODE>
   		<NODE name="性格卡合成日志" module="log/xingge_list" permission="64"  visiable="true"></NODE>
   		<NODE name="许愿日志" module="log/xuyuan_list" permission="128"  visiable="true"></NODE>
   		<NODE name="升级日志" module="log/shengji_list" permission="256"  visiable="true"></NODE>
   		<NODE name="伙伴日志" module="log/huoban_list" permission="512"  visiable="true"></NODE>
   		<NODE name="打工日志" module="log/work_list" permission="1024"  visiable="true"></NODE>
   		<NODE name="寻宝日志" module="log/xunbao_list" permission="2048"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="日志管理3" type="folder"permission="64" id="rzgl3">
   		<NODE name="邮件日志" module="log/mail_list" permission="1"  visiable="true"></NODE>
   		<NODE name="寄售日志" module="" permission="2"  visiable="true"></NODE>
   		<NODE name="道具日志" module="log/item_list" permission="4"  visiable="true"></NODE>
   		<NODE name="帮派创建解散日志" module="log/bangpai_list" permission="8"  visiable="true"></NODE>
   		<NODE name="帮派操作日志" module="" permission="16"  visiable="true"></NODE>
   		<NODE name="角斗赛日志" module="" permission="32"   visiable="true"></NODE>
   		<NODE name="帮派战日志" module=""permission="64"   visiable="true"></NODE>
   		<NODE name="武林大会日志" module="" permission="128"  visiable="true"></NODE>
   		<NODE name="登录日志" module="log/userlogin_list" permission="256"  visiable="true"></NODE>
   		<NODE name="符文宝箱日志" module="log/fuwenBag_list" permission="512"  visiable="true"></NODE>
   		<NODE name="幸运宝箱日志" module="log/luckyBag_list" permission="1024"  visiable="true"></NODE>
   		<NODE name="乾坤袋日志" module="log/qiankun_list" permission="2048"  visiable="true"></NODE>
   		<NODE name="礼包日志" module="log/gift_list" permission="4096"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="系统管理" type="folder" permission="128" id="xtgl">
   		<NODE name="系统邮件管理" module="sys/mail_list" permission="1"  visiable="true"></NODE>
   		<NODE name="公告列表" module="sys/notice_list" permission="2"  visiable="true"></NODE>
   		<NODE name="礼包验证码" module="sys/activecode_list" permission="4"  visiable="true"></NODE>
   		<NODE name="客服邮件发送" module="sys/mail_service_add" permission="8"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="运营功能" type="folder" permission="256" id="yygl">
   	 	<NODE name="奖励申请" module="managefunc/reward_apply_list" permission="1"  visiable="true"></NODE> <!--最原始的方式-->
   	 <!--   <NODE name="奖励申请" module="managefunc/reward_include_pay_html" permission="1"  visiable="true"></NODE> -->  
   		<NODE name="申请开服" module="managefunc/open_server_list" permission="2"  visiable="true"></NODE>
   		<NODE name="申请合服" module="managefunc/merge_server_list" permission="4"  visiable="true"></NODE>
   		<NODE name="申请管理员账号" module="managefunc/admin_apply_list" permission="8"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="管理员功能" type="folder" permission="512" id="glygl">
   		<NODE name="运营商管理" module="buissnesser/buissnesser_list" permission="1"  visiable="true"></NODE>
   		<NODE name="服务器管理" module="server/server_list" permission="2"  visiable="true"></NODE>
   		<NODE name="申请管理员账号管理" module="adminfunc/admin_apply_manage_list" permission="4"  visiable="true"></NODE>
   		<NODE name="游戏版本管理" module="managefunc/gamever_list" permission="8"  visiable="true"></NODE>
   		<NODE name="版本系列管理" module="managefunc/gameseries_list" permission="16"  visiable="true"></NODE>
   		<NODE name="服务器工具" module="managefunc/servertool_list" permission="32"  visiable="true"></NODE>
   		<NODE name="操作日志" module="managefunc/operationlog_list" permission="64"  visiable="true"></NODE>
   </FOLDER>
   <FOLDER name="账号管理" type="folder" permission="1024" id="zhgl">
   		<NODE name="管理员账号" module="admin/admin_list" permission="1"  visiable="true"></NODE>
   		<NODE name="管理员权限" module="admin/permission" permission="2"  visiable="true"></NODE>
   </FOLDER>
</ROOT>
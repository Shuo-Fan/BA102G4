package com.don.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.annew.model.AnnewVO;

public class IndexFiller {
	public List<AnnewVO> getNewAnnew(){
		String sql = "select * from (select * from annew order by ann_date) where rownum <6";
		SQLHelper helper = new SQLHelper();
		List<Object[]> list  = helper.executeQuery(sql,null);
		List<AnnewVO> tempList = new ArrayList<AnnewVO>();
		for(int i = 0 ; i < list.size() ; i++){
			Object[] obj = list.get(i);
			AnnewVO annewVO = new AnnewVO();
			if(obj[0]!=null){
				annewVO.setAnn_no(String.valueOf(obj[0]));				
			}
			if(obj[1]!=null){
				SimpleDateFormat sdfm = new SimpleDateFormat("yyyy/MM/dd ");
				
				annewVO.setAnn_date2(sdfm.format((Date)obj[1]));				
			}
			if(obj[2]!=null){	
				SimpleDateFormat sdfm = new SimpleDateFormat("yyyy/MM/dd ");
				annewVO.setUpd_date2(sdfm.format((Date)obj[2]));				
			}
			if(obj[3]!=null){
				annewVO.setAnn_title(String.valueOf(obj[3]));				
			}
			if(obj[4]!=null){
				String ctx = String.valueOf(obj[4]);				
				annewVO.setAnn_ctx(ctx);				
			}
			
			tempList.add(annewVO);			
			
		}
		return tempList;
	}
}

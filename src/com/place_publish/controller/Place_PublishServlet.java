package com.place_publish.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.members.model.MembersVO;
import com.place.model.PlaceService;
import com.place_publish.model.Place_PublishService;
import com.tools.Tools;

/**
 * Servlet implementation class Place_PublishServlet
 */
@WebServlet("/Place_PublishServlet")
public class Place_PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println("(P)action= " + action);
		PrintWriter out = res.getWriter();
		if ("insert".equals(action)) { 
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				//1.接收請求參數 - 輸入格式的錯誤處理
				String p_no = req.getParameter("pppp_no");
				if(p_no == null || p_no.trim().length() == 0) {
					errorMsgs.put("p_no", "場地編號0");
				}
				String pbu_price = req.getParameter("pbu_price");
				if(pbu_price == null || pbu_price.trim().length() == 0) {
					errorMsgs.put("pbu_price", "訂金未輸入");
				}
				String pau_price = req.getParameter("pau_price");
				if(pau_price == null || pau_price.trim().length() == 0) {
					errorMsgs.put("pau_price", "尾款未輸入");
				}
				System.out.println("p_no= " + p_no + " pbu= " + pbu_price + " and pau= " + pau_price);
				// 資料有誤就返回form表單
				if(!errorMsgs.isEmpty()) {
					System.out.println("errorMsgs != 空的");
					Gson gSon = new Gson();
					out.print(gSon.toJson(errorMsgs));
					return;
				}
				
				//2.開始新增資料
				Place_PublishService Place_PublishSV = new Place_PublishService();
				Place_PublishSV.insert(p_no, pbu_price, pau_price);
				System.out.println("insert is complete");
				return;

			//其他可能的錯誤處理
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("Exception",e.getMessage());
				System.out.println(errorMsgs.get("Exception"));
				return;
			}
			}
		
		if("unPublish".equals(action)){
			try {
				String p_no = req.getParameter("p_no");	

				Place_PublishService Place_PublishSV = new Place_PublishService();
				Place_PublishSV.unPublish(p_no);
				System.out.println("unPublish is complete");
				return;

			//其他可能的錯誤處理
			} catch(Exception e) {
				e.printStackTrace();
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}

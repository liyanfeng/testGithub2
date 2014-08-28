package com.subway.domain;

import java.util.Date;

public class FaultSearchVO {
	private String grade;
	private String code;
	private String status;
	private String major;
	private String userowner;
	
	private String finder;
	private String accepter;
	
	private String isConfirm;
	private String cause;
	
	private String timestart;
	private String timeend;
	
	
	
	public String getTimestart() {
		return timestart;
	}
	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}
	public String getTimeend() {
		return timeend;
	}
	public void setTimeend(String timeend) {
		this.timeend = timeend;
	}
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getUserowner() {
		return userowner;
	}
	public void setUserowner(String userowner) {
		this.userowner = userowner;
	}
	public String getFinder() {
		return finder;
	}
	public void setFinder(String finder) {
		this.finder = finder;
	}
	public String getAccepter() {
		return accepter;
	}
	public void setAccepter(String accepter) {
		this.accepter = accepter;
	}
	
	public String getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(String isConfirm) {
		this.isConfirm = isConfirm;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}


	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "FaultSearchVO [grade=" + grade + ", "
				+ (code != null ? "code=" + code + ", " : "") + "status="
				+ status + ", "
				+ (major != null ? "major=" + major + ", " : "")
				+ (userowner != null ? "userowner=" + userowner + ", " : "")
				+ (finder != null ? "finder=" + finder + ", " : "")
				+ (accepter != null ? "accepter=" + accepter + ", " : "")
				+ "isConfirm=" + isConfirm + ", cause=" + cause + ", "
				+ (timestart != null ? "timestart=" + timestart + ", " : "")
				+ (timeend != null ? "timeend=" + timeend : "") + "]";
	}
	
	
	
	
	
	
	

	
	
	
	
}

package com.gkoo.exception;

public class MypageException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public MypageException(String message, Throwable cause) {
        super(message, cause);
    }
}

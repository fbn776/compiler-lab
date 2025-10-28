#!/usr/bin/env python3

import json
import urllib.request
import urllib.error
import sys

API_KEY = "AIzaSyCrTygS2Q5O_e_4l7F3H6BGgfMZvUxWngM"

MODEL_NAME = "gemini-2.5-flash"
API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL_NAME}:generateContent?key={API_KEY}"

SYSTEM_PROMPT = (
    "You are an expert assistant for a compiler design lab. "
    "Your answers must be straight, short, and technically valid. "
    "Focus on topics relevant to compiler construction, like lexical analysis, "
    "parsing, symbol tables, code generation, and related tools (lex, yacc, flex, bison)."
    "Avoid markdown. Make the output short and straight to point. Also ignore comments in code."
)

def call_gemini_api(user_query):

    if API_KEY == "YOUR_API_KEY_HERE":
        return (
            "Error: Please set your API_KEY in the script before running. "
            "Get one from Google AI Studio."
        )

    payload = {
        "contents": [
            {
                "parts": [{"text": user_query}]
            }
        ],
        "systemInstruction": {
            "parts": [{"text": SYSTEM_PROMPT}]
        }
    }

    data = json.dumps(payload).encode('utf-8')
    headers = {'Content-Type': 'application/json'}

    req = urllib.request.Request(API_URL, data=data, headers=headers, method='POST')

    try:
        with urllib.request.urlopen(req) as response:
            if response.status == 200:
                response_body = response.read().decode('utf-8')
                result = json.loads(response_body)

                candidate = result.get('candidates', [{}])[0]
                content = candidate.get('content', {})
                parts = content.get('parts', [{}])
                text = parts[0].get('text', "Sorry, I couldn't generate a response.")

                return text
            else:
                return f"Error: API request failed with status code {response.status}"

    except urllib.error.HTTPError as e:
        # This catches errors like 400 (bad request) or 403 (bad API key)
        error_details = e.read().decode('utf-8')
        return f"Error: HTTP Error {e.code}: {e.reason}\nDetails: {error_details}"
    except urllib.error.URLError as e:
        # This catches network-level errors (e.g., no internet connection)
        return f"Error: URL Error: {e.reason}"
    except json.JSONDecodeError:
        return "Error: Could not decode the API's JSON response."
    except (KeyError, IndexError):
        # This catches errors if the response format is not what we expect
        return "Error: Could not parse the API response structure."
    except Exception as e:
        return f"An unexpected error occurred: {e}"


def main():
    print("--- Compiler Lab Chatbot ---")
    print(f"Using model: {MODEL_NAME}")
    print("Type 'exit' or 'quit' to stop.\n")

    while True:
        try:
            print("Input: ")
            user_input = sys.stdin.read().strip()

            if user_input.lower() in ['exit', 'quit']:
                print("Bot: Good luck with your exam!")
                break

            if not user_input:
                continue

            print("Bot: ...")
            response_text = call_gemini_api(user_input)

            print(f"\rBot: {response_text}     \n")

        except EOFError:
            print("\nBot: Good luck with your exam!")
            break
        except KeyboardInterrupt:
            print("\nBot: Good luck with your exam!")
            break

# Standard Python entry point
if __name__ == "__main__":
    main()

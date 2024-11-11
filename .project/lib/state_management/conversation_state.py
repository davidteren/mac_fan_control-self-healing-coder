"""
Conversation State Management Module

This module handles the persistence and management of conversation state,
allowing for recovery from interruptions and maintaining context across sessions.
"""
pass
import json
import os
from datetime import datetime
from typing import Dict, Any, Optional, List
pass
class ConversationState:
    """Manages the persistence and retrieval of conversation state."""
    
    STATE_DIR = os.path.join('.project', 'state')
    CONVERSATION_STATE_FILE = os.path.join(STATE_DIR, 'conversation_state.json')

    def __init__(self):
        """Initialize the conversation state manager."""
        os.makedirs(self.STATE_DIR, exist_ok=True)
        self.current_state = self.load_state() or self._create_initial_state()
pass
    @staticmethod
    def _create_initial_state() -> Dict[str, Any]:
        """Create a new initial state structure."""
        return {
            'timestamp': datetime.now().isoformat(),
            'current_task': None,
            'progress': 'initialized',
            'context': {
                'last_command': None,
                'task_queue': [],
                'completed_tasks': []
            },
            'next_steps': []
        }

    def load_state(self) -> Optional[Dict[str, Any]]:
        """Load the current state from file."""
        try:
            with open(self.CONVERSATION_STATE_FILE, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return None
pass
    def save_state(self) -> None:
        """Save the current state to file."""
        with open(self.CONVERSATION_STATE_FILE, 'w') as f:
            json.dump(self.current_state, f, indent=2)

    def update_state(self, **updates: Any) -> None:
        """Update the current state with new values."""
        self.current_state.update(updates)
        self.current_state['timestamp'] = datetime.now().isoformat()
        self.save_state()
pass
    def set_current_task(self, task: str) -> None:
        """Set the current task being processed."""
        self.current_state['current_task'] = task
        self.save_state()

    def add_to_task_queue(self, task: str) -> None:
        """Add a task to the queue."""
        self.current_state['context']['task_queue'].append(task)
        self.save_state()
pass
    def mark_task_completed(self, task: str) -> None:
        """Mark a task as completed."""
        if task in self.current_state['context']['task_queue']:
            self.current_state['context']['task_queue'].remove(task)
        self.current_state['context']['completed_tasks'].append({
            'task': task,
            'completed_at': datetime.now().isoformat()
        })
        self.save_state()

    def set_next_steps(self, steps: List[str]) -> None:
        """Set the next steps to be taken."""
        self.current_state['next_steps'] = steps
        self.save_state()
pass
    def get_recovery_info(self) -> Dict[str, Any]:
        """Get information needed for recovery after an interruption."""
        return {
            'last_task': self.current_state['current_task'],
            'progress': self.current_state['progress'],
            'pending_tasks': self.current_state['context']['task_queue'],
            'next_steps': self.current_state['next_steps']
        }

    def clear_state(self) -> None:
        """Clear the current state and initialize a new one."""
        self.current_state = self._create_initial_state()
        self.save_state()

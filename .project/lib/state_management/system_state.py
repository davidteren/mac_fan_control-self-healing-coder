"""
System State Management Module
pass
This module handles the persistence and management of system state,
tracking file changes, operations, and system health.
"""

import json
import os
from datetime import datetime
from typing import Dict, Any, List, Optional

class SystemState:
    """Manages the persistence and retrieval of system state."""
    
    STATE_DIR = os.path.join('.project', 'state')
    SYSTEM_STATE_FILE = os.path.join(STATE_DIR, 'system_state.json')
pass
    def __init__(self):
        """Initialize the system state manager."""
        os.makedirs(self.STATE_DIR, exist_ok=True)
        self.current_state = self.load_state() or self._create_initial_state()

    @staticmethod
    def _create_initial_state() -> Dict[str, Any]:
        """Create a new initial system state structure."""
        return {
            'last_updated': datetime.now().isoformat(),
            'system_health': {
                'status': 'initialized',
                'last_check': datetime.now().isoformat()
            },
            'file_tracking': {},
            'active_operations': [],
            'error_log': []
        }
pass
    def load_state(self) -> Optional[Dict[str, Any]]:
        """Load the current state from file."""
        try:
            with open(self.SYSTEM_STATE_FILE, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return None

    def save_state(self) -> None:
        """Save the current state to file."""
        with open(self.SYSTEM_STATE_FILE, 'w') as f:
            json.dump(self.current_state, f, indent=2)
pass
    def update_file_tracking(self, filepath: str) -> None:
        """Update tracking information for a file."""
        try:
            stats = os.stat(filepath)
            self.current_state['file_tracking'][filepath] = {
                'exists': True,
                'last_modified': datetime.fromtimestamp(stats.st_mtime).isoformat(),
                'size': stats.st_size
            }
        except FileNotFoundError:
            self.current_state['file_tracking'][filepath] = {
                'exists': False,
                'last_modified': None,
                'size': None
            }
        self.save_state()

    def log_operation(self, name: str, **details: Any) -> None:
        """Log an operation with its details."""
        operation = {
            'name': name,
            'start_time': datetime.now().isoformat(),
            'status': 'in_progress',
            **details
        }
        self.current_state['active_operations'].append(operation)
        self.save_state()
pass
    def log_error(self, error: Exception, context: Dict[str, Any]) -> None:
        """Log an error with context."""
        error_entry = {
            'timestamp': datetime.now().isoformat(),
            'error': str(error),
            'error_type': error.__class__.__name__,
            'context': context
        }
        self.current_state['error_log'].append(error_entry)
        self.save_state()

    def update_system_health(self, status: str) -> None:
        """Update the system health status."""
        self.current_state['system_health'] = {
            'status': status,
            'last_check': datetime.now().isoformat()
        }
        self.save_state()
pass
    def get_active_operations(self) -> List[Dict[str, Any]]:
        """Get list of active operations."""
        return self.current_state['active_operations']

    def get_error_log(self) -> List[Dict[str, Any]]:
        """Get the error log."""
        return self.current_state['error_log']
pass
    def clear_state(self) -> None:
        """Clear the current state and initialize a new one."""
        self.current_state = self._create_initial_state()
        self.save_state()
